module SteamApi
  # This module is for interacting with the IPlayerService interface of the Steam Web API.
  # More information about this interface can be found at https://wiki.teamfortress.com/wiki/WebAPI
  module IPlayerService
    # Gets a list of users recently played games.
    # @param userid [String] A user's steam id 64
    # @param count [Fixnum] The number of games to return
    # @return [Hash] Contains a hash which has information about a users recently played games (if the profile is public)
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetRecentlyPlayedGames
    def get_recently_played_games(userid, count=0)
      url = SteamApi::Urls.recently_played_games(userid, count)
      response = get(url, key_needed: true)
    end

    # Gets a list of all the users owned games.
    # @param userid [String] A user's steam id 64
    # @param include_appinfo [Boolean] (Optional) A boolean indicating whether to include information about the game (name, pictures, playtime)
    # @param include_played_free_games [Boolean] (Optional) A boolean indicating whether to include free to play games
    # @return [Hash] Contains a hash which has information about the list of users games (if the profile is public)
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetOwnedGames
    def get_owned_games(userid, include_appinfo: false, include_played_free_games: false)
      include_appinfo = bool_to_int(include_appinfo)
      include_played_free_games = bool_to_int(include_played_free_games)
      url = SteamApi::Urls.owned_games(userid, include_appinfo, include_played_free_games)
      response = get(url, key_needed: true)
    end

    # Gets a users Steam level
    # @param userid [String] A user's steam id 64
    # @return [Hash] Contains a hash which has the users Steam level
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetSteamLevel
    def get_steam_level(userid)
      url = SteamApi::Urls.steam_level(userid)
      response = get(url, key_needed: true)
    end

    # Gets info about a single users badge completion
    # @param userid [String] A user's steam id 64
    # @return [Hash] Contains a hash which has the users badges
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetBadges
    def get_badges(userid)
      url = SteamApi::Urls.badges(userid)
      response = get(url, key_needed: true)
    end

    # Gets info about a single users progress towards community badges
    # @param userid [String] A user's steam id 64
    # @param badge_id [String] (Optional) A specific badge id to look for
    # @return [Hash] Contains a hash which has the users progress
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetCommunityBadgeProgress
    def get_community_badge_progress(userid, badge_id: 0)
      url = SteamApi::Urls.community_badge_progress(userid, badge_id)
      response = get(url, key_needed: true)
    end

    private
    # A method to map a boolean value to an integer
    # @param bool [Boolean] A boolean value
    # @return [Fixnum] The mapped-to Fixnum
    def bool_to_int(bool)
      bool ? 1 : 0
    end
  end
end