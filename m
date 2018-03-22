From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: fix #XM delivery typo
Date: Thu, 22 Mar 2018 08:40:04 -0600
Message-ID: <5AB3CE5402000078001B5277@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez1Nv-0005qd-NW
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 14:40:07 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjbGVhcmx5IHdhc24ndCBtZWFudCB0aGUgd2F5IGl0IHdhcyBvcmlnaW5hbGx5IHdyaXR0
ZW4uCgpSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94
ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC04NjYyLDcgKzg2NjIsNyBAQCB4ODZfZW11bGF0
ZSgKICAgICB7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0OwogCi0gICAgICAgIGlmICggIW9w
cy0+cmVhZF9jciB8fCAhb3BzLT5yZWFkX2NyKDQsICZjcjQsIGN0eHQpID09IFg4NkVNVUxfT0tB
WSApCisgICAgICAgIGlmICggIW9wcy0+cmVhZF9jciB8fCBvcHMtPnJlYWRfY3IoNCwgJmNyNCwg
Y3R4dCkgIT0gWDg2RU1VTF9PS0FZICkKICAgICAgICAgICAgIGNyNCA9IFg4Nl9DUjRfT1NYTU1F
WENQVDsKICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uKGNyNCAmIFg4Nl9DUjRfT1NYTU1FWENQ
VCA/IEVYQ19YTSA6IEVYQ19VRCk7CiAgICAgfQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
