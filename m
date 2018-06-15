From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 3/3] tools/libxc: retry hypercall in case of
 EFAULT
Date: Fri, 15 Jun 2018 15:52:02 +0100
Message-ID: <23331.53906.117992.935305@mariner.uk.xensource.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cupv=jb=citrix.com=prvs=6970733d4=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fTq58-0002Jx-BV
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:52:06 +0000
In-Reply-To: <20180615132641.5461-4-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggMy8zXSB0b29scy9saWJ4YzogcmV0cnkgaHlw
ZXJjYWxsIGluIGNhc2Ugb2YgRUZBVUxUIik6Cj4gQSBoeXBlcmNhbGwgaXNzdWVkIHZpYSB0aGUg
cHJpdmNtZCBkcml2ZXIgY2FuIHZlcnkgcmFyZWx5IHJldHVybgo+IC1FRkFVTFQgZXZlbiBpZiB0
aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJlIGxvY2tlZCBpbiBtZW1vcnkuIFRoaXMKPiBoYXBwZW5z
IGZvciBoeXBlcmNhbGwgYnVmZmVycyBpbiB1c2VyIG1lbW9yeSB3aGVuIHRoZSBMaW51eCBrZXJu
ZWwKPiBpcyBkb2luZyBtZW1vcnkgc2NhbnMgZS5nLiBmb3IgcGFnZSBtaWdyYXRpb24gb3IgY29t
cGFjdGlvbi4KPiAKPiBSZXRyeSB0aGUgZ2V0cGFnZWZyYW1laW5mbzMgaHlwZXJjYWxsIHVwIHRv
IDIgdGltZXMgaW4gY2FzZQo+IC1FRkFVTFQgaXMgcmV0dXJuZWQgYW5kIHRoZSBoeXBlcnZpc29y
IG1pZ2h0IHNlZSBpbnZhbGlkIFBURXMgZm9yCj4gdXNlciBoeXBlcmNhbGwgYnVmZmVycy4KCkl0
IHdvdWxkIGJlIHdvcnRoIG1lbnRpb25pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRoYXQgdGhp
cyBpcyBhCndvcmthcm91bmQgZm9yIHN5c3RlbXMgd2l0aG91dCBwcml2Y21kLWJ1Ziwgd2hpY2gg
ZG9lcyBub3QgaGF2ZSB0aGlzCmJ1Zy4gIEJ1dCBuZXZlcnRoZWxlc3M6CgpBY2tlZC1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpPdmVyYWxsLCB0aGFua3MgZm9y
IGNoYXNpbmcgdXAgdGhpcyBsb25nLXN0YW5kaW5nIGJ1Zy4KClRoYW5rcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
