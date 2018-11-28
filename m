From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] xl: free bitmaps on exit
Date: Wed, 28 Nov 2018 12:31:25 +0000
Message-ID: <20181128123125.rra53ny7pzwsm5pa@zion.uk.xensource.com>
References: <20181128122434.15124-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fE64=OH=citrix.com=prvs=863b436f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRz1N-0006tl-UE
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 12:32:49 +0000
Content-Disposition: inline
In-Reply-To: <20181128122434.15124-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDE6MjQ6MzRQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gRXZlcnkgaW52b2NhdGlvbiBvZiB4bCB2aWEgdmFsZ3JpbmQgd2lsbCBzaG93IHRocmVl
IGxlYWtzLgo+IFNpbmNlIGxpYnhsX2JpdG1hcF9hbGxvYyB1c2VzIE5PR0MsIHRoZSBjYWxsZXIg
aGFzIHRvIGZyZWUgdGhlIG1lbW9yeQo+IGFmdGVyIHVzZS4gQW5kIHNpbmNlIHhsX2N0eF9mcmVl
IG1pZ2h0IGJlIGNhbGxlZCBiZWZvcmUKPiBwYXJzZV9nbG9iYWxfY29uZmlnLCBhbHNvIG1vdmUg
dGhlIGxpYnhsX2JpdG1hcF9pbml0IGNhbGxzIGludG8KPiB4bF9jdHhfYWxsb2MuCj4gCj4gQWxz
byBtb3ZlIHRoZSBjYWxsIHRvIGF0ZXhpdCgpIGFmdGVyIHhsX2N0eF9hbGxvYywgYmVjYXVzZSB0
aGUgbGF0dGVyIGlzCj4gYWxzbyBjYWxsZWQgYWdhaW4gaW4gcG9zdGZvcmsuCj4gCj4gU2lnbmVk
LW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
