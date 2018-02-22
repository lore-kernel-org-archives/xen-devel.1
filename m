From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xenstore: increase default thread stack
 size to 32k
Date: Thu, 22 Feb 2018 11:35:21 +0000
Message-ID: <20180222113521.skuzd3otv7xquvmu@MacBook-Pro-de-Roger.local>
References: <20180221221341.17452-1-jfehlig@suse.com>
 <23182.42661.155867.810718@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tlcy=fq=citrix.com=prvs=584ccea7e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eop9y-0001TP-9f
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 11:35:34 +0000
Content-Disposition: inline
In-Reply-To: <23182.42661.155867.810718@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjIsIDIwMTggYXQgMTE6MTY6NTNBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSmltIEZlaGxpZyB3cml0ZXMgKCJbUEFUQ0hdIHhlbnN0b3JlOiBpbmNyZWFzZSBkZWZh
dWx0IHRocmVhZCBzdGFjayBzaXplIHRvIDMyayIpOgo+ID4gT24gc2V2ZXJhbCBTa3lsYWtlIG1h
Y2hpbmVzIEkndmUgb2JzZXJ2ZWQgeGwgc2VnZmF1bHRzIHdoZW4gcnVubmluZwo+ID4gY3JlYXRl
IG9yIGRlc3Ryb3kgc3ViY29tbWFuZHMuIE90aGVyIHN1YmNvbW1hbmRzIG1heSBzZWdmYXVsdCB0
b28sCj4gPiBidXQgSSd2ZSBvbmx5IGxvb2tlZCBhdCBjcmVhdGUgYW5kIGRlc3Ryb3kgd2hpY2gg
c2hhcmUgYSBzaW1pbGFyCj4gPiBiYWNrdHJhY2UKPiAKPiBBY2tlZC1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gSG93ZXZlciwgSSBhbSBjb25jZXJuZWQg
dGhhdCB0aGlzIGlzbid0IGEgdmVyeSBzeXN0ZW1hdGljIHdheSBvZgo+IGFkZHJlc3NpbmcgdGhp
cyBwcm9ibGVtLiAgSG93IGRvIHdlIGtub3cgdGhhdCAzMksgaXMgZW5vdWdoID8KPiBXZSBoYXZl
IGFscmVhZHkgaW5jcmVhc2VkIHRoaXMgbnVtYmVyIG9uY2UuCj4gCj4gQWx0ZXJuYXRpdmVseSwg
bWF5YmUgdGhpcyBpYSBhIGJ1ZyBpbiB0aGUgcGxhdGZvcm0gbGliYyA/CgpJcyBpdCByZWFsbHkg
dGhhdCBiYWQgdG8gdXNlIHRoZSBkZWZhdWx0IHRocmVhZCBzdGFjayBzaXplPyBUaGF0J3MKZ29p
bmcgdG8gYmUgbXVjaCBiaWdnZXIsIEkga25vdywgYnV0IEkgYXNzdW1lIHBoeXNpY2FsIG1lbW9y
eSBmb3IgdGhlCnN0YWNrIHdpbGwgYmUgbWFwcGVkIG9uIGRlbWFuZCwgYW5kIHRodXMgdGhlIHBo
eXNpY2FsIG1lbW9yeSB1c2FnZSBpcwpub3QgZ29pbmcgdG8gYmUgdGhhdCBkaWZmZXJlbnQuCgpJ
J3ZlIGJlZW4gYWx3YXlzIHRvbGQgdG8gc2ltcGx5IG5vdCBwbGF5IHdpdGggdGhlIHN0YWNrIHNp
emUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
