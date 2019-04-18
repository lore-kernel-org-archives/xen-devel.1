From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Xen project CI systems and committer workflow
Date: Thu, 18 Apr 2019 14:21:44 +0100
Message-ID: <23736.31208.463641.725834@mariner.uk.xensource.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH6zD-0002OB-5Q
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 13:21:55 +0000
In-Reply-To: <20190418123159.GD30543@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Committers <committers@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGwgc291bmRzIGdvb2QuCgpXZWkgTGl1IHdyaXRlcyAoIlhlbiBwcm9qZWN0IENJIHN5
c3RlbXMgYW5kIGNvbW1pdHRlciB3b3JrZmxvdyIpOgo+ICMjIEdhcHMKPiAKPiBUaGUgY29tcG9u
ZW50IC8gc3lzdGVtIHdoaWNoIG1lcmdlcyB0cmVlcyBhbmQgZHJpdmVzIENJIHN5c3RlbXMgaXMg
bWlzc2luZy4KPiAKPiBQYXRjaGV3IGFuZCBQYXRjaHdvcmsgZG9uJ3QgZG8gYWxsIHRoZSB0aGlu
Z3Mgd2UgY2FyZSBhYm91dCB5ZXQuCgpXZSBuZWVkIHRvIGRlY2lkZSBob3cgdGhlIHBsdW1iaW5n
IHNob3VsZCBiZSBhcnJhbmdlZC4KCj4gIyMgQ29uY2VybnMKPiAKPiBGb3IgaW5kaXZpZHVhbCBj
b21taXR0ZXJzLCB0dXJuYXJvdW5kIHRpbWUgbWF5IGJlY29tZSBsb25nZXIgc2luY2UKPiB5b3Ug
bmVlZCB0byB3YWl0IGZvciBvdGhlciB0cmVlcyB0byBiZSBwcm9jZXNzZWQuCgpUaGlzIHdpbGwg
cHJvYmFibHkgYmUgd29ydGggaXQuCgpBIHByb2JsZW0gd2UgaWRlbnRpZmllZCBpbiBJUkwgZGlz
Y3Vzc2lvbiBpcyB0aGF0IGN1cnJlbnRseSB3ZSByZWx5CnJhdGhlciB0b28gbXVjaCBvbiBvc3N0
ZXN0IHJldGVzdGluZyB0aGUgc2FtZSB0cmVlLCBiZWNhdXNlIG9mCmhlaXNlbmJ1Z3MuICBXaXRo
IHRoZSBuZXcgc2NoZW1lIGl0IHdvdWxkIHNwZW5kIG1vcmUgb2YgaXRzIHRpbWUKdGVzdGluZyB0
aGluZ3Mgd2hpY2ggd291bGQgbmV2ZXIgYmUgcmV0ZXN0ZWQuICBTbyBJIHRoaW5rIGluIHlvdXIK
YGdhcHMnIHdlIG5lZWQgdGhpczoKCiAgb3NzdGVzdCBmYWNpbGl0eSB0byBhdXRvbWF0aWNhbGx5
IHJldHJ5IGZhaWxpbmcgdGVzdHMKCihUaGlzIGZlZWxzIGxpa2UgYWRtaXR0aW5nIGRlZmVhdCBi
dXQgSSBoYXZlIG9jY2FzaW9uYWxseSBoYWQgYQpjYW1wYWlnbiBvZiB0cnlpbmcgdG8gc3F1YXNo
IGhlaXNlbmJ1Z3MgYW5kIGl0IGlzICpyZWFsbHkgaGFyZCB3b3JrKi4KSSBkb3VidCB3ZSBjYW4g
Z2V0IHJpZCBvZiB0aGVtIGNvbXBsZXRlbHkuKQoKPiBHaXRsYWIgQ0kgZG9lc24ndCBoYXZlIGEg
c2VsZiBwdXNoZ2F0ZS4gSWYgaXQgaXMgYnJva2VuIGJ5IGFjY2lkZW50IE9zc3Rlc3QKPiB3aWxs
IGJlIGJsb2NrZWQuCgpDb3VsZCB3ZSBwbGFuIHNvbWUga2luZCBvZiBwcm9jZWR1cmFsIG9yIHJv
Ym90aWMgd29ya2Fyb3VuZCA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
