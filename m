From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 8/8] tools/libvchan:
 libxenvchan_client_init: use ENOENT for no server
Date: Tue, 6 Nov 2018 11:45:47 +0000
Message-ID: <23521.32491.467037.246289@mariner.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-9-ian.jackson@eu.citrix.com>
 <20181106100016.hawdyzngqvo3zi73@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdlp=nr=citrix.com=prvs=841612198=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gJzns-0003tD-NF
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 11:45:52 +0000
In-Reply-To: <20181106100016.hawdyzngqvo3zi73@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDgvOF0gdG9vbHMvbGlidmNoYW46IGxpYnhlbnZj
aGFuX2NsaWVudF9pbml0OiB1c2UgRU5PRU5UIGZvciBubyBzZXJ2ZXIiKToKPiBPbiBGcmksIE5v
diAwMiwgMjAxOCBhdCAwNTowMToxM1BNICswMDAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ICog
UHJvbWlzZSB0aGF0IHdlIHdpbGwgc2V0IGVycm5vIHRvIEVOT0VOVCBpZiB0aGUgc2VydmVyIGlz
IG5vdAo+ID4gICB5ZXQgc2V0IHVwLgo+ID4gKiBBcnJhbmdlIHRoYXQgYWxsIEVOT0VOVCByZXR1
cm5zIG90aGVyIHRoYW4gZnJvbSB0aGUgcmVhZCBvZiByaW5nLXJlZgo+ID4gICBhcmUgdHVybmVk
IGludG8gRUlPLCBsb2dnaW5nIHdoZW4gd2UgZG8gc28uCj4gCj4gVGhpcyBzb3VuZHMgcmVhc29u
YWJsZSB0byBtZSwgYnV0IEkgd291bGQgbGlrZSB0byBoZWFyIGZyb20gTWFyZWsgdGhhdAo+IHRo
aXMgZG9lc24ndCBicmVhayBRdWJlcy4KClJpZ2h0LiAgTWFyZWssIHRoaXMgc2VyaWVzIHdhcyBp
bnRlbmRlZCB0byBoZWxwIHdpdGggdmNoYW4gZm9yIHFtcC4KQnV0IG9idmlvdXNseSBJIGRvbid0
IHdhbnQgdG8gYnJlYWsgYW55dGhpbmcgZWxzZS4gIEkgZG9uJ3QgdGhpbmsgdGhpcwpzaG91bGQg
YnJlYWsgYW55dGhpbmcgYnV0IEkgd291bGQgYXBwcmVjaWF0ZSBhIHJldmlldyBvciBhdCBsZWFz
dCBhbgpvcGluaW9uLi4uCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
