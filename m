From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 3/3] tools/libxc: retry hypercall in case
 of EFAULT
Date: Mon, 18 Jun 2018 12:26:38 +0100
Message-ID: <23335.38638.582470.134275@mariner.uk.xensource.com>
References: <20180618071856.25383-1-jgross@suse.com>
 <20180618071856.25383-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nblf=je=citrix.com=prvs=700d25f67=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fUsJ0-0002wL-3C
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 11:26:42 +0000
In-Reply-To: <20180618071856.25383-4-jgross@suse.com>
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

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjIgMy8zXSB0b29scy9saWJ4YzogcmV0cnkg
aHlwZXJjYWxsIGluIGNhc2Ugb2YgRUZBVUxUIik6Cj4gQSBoeXBlcmNhbGwgaXNzdWVkIHZpYSB0
aGUgcHJpdmNtZCBkcml2ZXIgY2FuIHZlcnkgcmFyZWx5IHJldHVybgo+IC1FRkFVTFQgZXZlbiBp
ZiB0aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJlIGxvY2tlZCBpbiBtZW1vcnkuIFRoaXMKPiBoYXBw
ZW5zIGZvciBoeXBlcmNhbGwgYnVmZmVycyBpbiB1c2VyIG1lbW9yeSB3aGVuIHRoZSBMaW51eCBr
ZXJuZWwKPiBpcyBkb2luZyBtZW1vcnkgc2NhbnMgZS5nLiBmb3IgcGFnZSBtaWdyYXRpb24gb3Ig
Y29tcGFjdGlvbi4KPiAKPiBSZXRyeSB0aGUgZ2V0cGFnZWZyYW1laW5mbzMgaHlwZXJjYWxsIHVw
IHRvIDIgdGltZXMgaW4gY2FzZQo+IC1FRkFVTFQgaXMgcmV0dXJuZWQgYW5kIHRoZSBoeXBlcnZp
c29yIG1pZ2h0IHNlZSBpbnZhbGlkIFBURXMgZm9yCj4gdXNlciBoeXBlcmNhbGwgYnVmZmVycyAo
d2hpY2ggc2hvdWxkIGJlIHRoZSBjYXNlIG9ubHkgaWYgdGhlIGtlcm5lbAo+IGRvZXNuJ3Qgb2Zm
ZXIgYSAvZGV2L3hlbi9oeXBlcmNhbGwgbm9kZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
