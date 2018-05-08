From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH v2 08/19] ts-guests-nbd-mirror: use
 target_{get, put}file_root to transfter cfg
Date: Tue, 8 May 2018 09:14:27 +0100
Message-ID: <20180508081427.2vghxhim6wti5jx5@citrix.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-9-wei.liu2@citrix.com>
 <23199.65417.402495.909095@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6yvq=h3=citrix.com=prvs=659576998=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fFxlY-0006zh-EW
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 08:14:32 +0000
Content-Disposition: inline
In-Reply-To: <23199.65417.402495.909095@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDM6MDQ6NDFQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJbT1NTVEVTVCBQQVRDSCB2MiAwOC8xOV0gdHMtZ3Vlc3Rz
LW5iZC1taXJyb3I6IHVzZSB0YXJnZXRfe2dldCxwdXR9ZmlsZV9yb290IHRvIHRyYW5zZnRlciBj
ZmciKToKPiA+IFRoZSBvcmlnaW5hbCBjb2RlIHVzZWQgdGFyZ2V0X2NtZF9vdXRwdXRfcm9vdCB3
aGljaCBjYXVzZWQgYSB0cmFpbGluZwo+ID4gbmV3IGxpbmUgdG8gYmUgZGVsZXRlZCwgd2hpY2gg
Y2F1c2VkIGxpYnZpcnQgY29udmVydGVyIHRvIGZhaWwuCj4gPiAKPiA+IEl0IHdhc24ndCBkaXNj
b3ZlcmVkIHVudGlsIG5vdyBiZWNhdXNlIHdlIGFwcGVuZGVkIHRvbyBtYW55ICJcbiIuCj4gPiAK
PiA+IFVzZSB0YXJnZXRfe2dldCxwdXR9ZmlsZV9yb290IHRvIGRvIHRoZSBqb2IuCj4gCj4gTWF5
YmUgdGFyZ2V0X2dldGZpbGVjb250ZW50cyBhbmQgc3Rhc2hmaWxlY29udGVudHMgYW5kCj4gdGFy
Z2V0X3B1dGZpbGVjb250ZW50cyB3b3VsZCBiZSBlYXNpZXIgYW5kIGFsc28gYmV0dGVyID8KPiAK
PiBJdCBpcyB1c3VhbGx5IGJldHRlciB0byB1c2UgdGhlIGV4aXN0aW5nIGZhY2lsaXRpZXMgZm9y
IGludmVudGluZwo+IHN0YXNoIGZpbGUgbmFtZXMgYmVjYXVzZSB0aGV5IGNoZWNrIGZvciB1bmlx
dWVuZXNzLgo+IAoKVGhlcmUgaXMgbm8gdGFyZ2V0X2dldGZpbGVjb250ZW50cywgYW5kIHRoZSBt
ZXRob2QgSSB1c2VkIGlzIHVzZWQKdGhyb3VnaG91dCBvc3N0ZXN0IGNvZGUuCgo+IE9yIG1heWJl
IHlvdSB3YW50IHRvIGludmVudCBgdGFyZ2V0X2dldGZpbGVfc3Rhc2gnIHdoaWNoIHVzZXMKPiBv
cGVuX3VuaXF1ZV9zdGFzaGZpbGUgYW5kIHRhcmdldF9nZXRmaWxlLCBhbmQgcmV0dXJucyB0aGUg
ZmlsZW5hbWUuCj4gCgpMZXQgbWUgc2VlIGlmIEkgY2FuIGludmVudCBzb21ldGhpbmcgYWZ0ZXIg
Zml4aW5nIHRob3NlIG1vcmUgaW1wb3J0YW50Cmlzc3Vlcy4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
