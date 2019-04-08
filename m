From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: Cap the number of interrupt
 lines for dom0
Date: Mon, 8 Apr 2019 11:15:58 +0100
Message-ID: <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
References: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDRJq-0004IG-SQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:16:02 +0000
In-Reply-To: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lukas Juenger <juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgTHVrYXMsCgpPbiA0LzUvMTkgMjo1NCBQTSwgTHVrYXMgSnVlbmdlciB3cm90ZToKPiBEb20w
IHZHSUMgd2lsbCB1c2UgdGhlIHNhbWUgbnVtYmVyIG9mIGludGVycnVwdCBsaW5lcyBhcyB0aGUg
aGFyZHdhcmUgR0lDLgo+IFdoaWxlIHRoZSBoYXJkd2FyZSBHSUMgY2FuIHN1cHBvcnQgdXAgdG8g
MTAyMCBpbnRlcnJ1cHQgbGluZXMsCj4gdGhlIHZHSUMgaXMgb25seSBzdXBwb3J0aW5nIHVwIHRv
IDk5MiBpbnRlcnJ1cHQgbGluZXMuCj4gVGhpcyBtZWFucyB0aGF0IFhlbiB3aWxsIG5vdCBiZSBh
YmxlIHRvIGJvb3Qgb24gcGxhdGZvcm1zIHdoZXJlIHRoZSBoYXJkd2FyZQo+IEdJQyBzdXBwb3J0
cyBtb3JlIHRoYW4gOTkyIGludGVycnVwdCBsaW5lcy4KPiBXaGlsZSBpdCB3b3VsZCBtYWtlIHNl
bnNlIHRvIGluY3JlYXNlIHRoZSBsaW1pdHMgaW4gdGhlIHZHSUNzLCB0aGlzIGlzIG5vdAo+IHRy
aXZpYWwgYmVjYXVzZSBvZiB0aGUgZGVzaWduIGNob2ljZXMuCj4gQXQgdGhlIG1vbWVudCwgb25s
eSBtb2RlbHMgc2VlbSB0byByZXBvcnQgdGhlIG1heGltdW0gb2YgaW50ZXJydXB0IGxpbmVzLgo+
IFRoZXkgYWxzbyBkbyBub3QgaGF2ZSBhbnkgaW50ZXJydXB0IHdpcmVkIGFib3ZlIHRoZSA5OTIg
bGltaXQuCj4gU28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gY2FwIHRoZSBudW1iZXIgb2YgaW50ZXJy
dXB0IGxpbmVzIGZvciBkb20wIHRvIDk5MiBsaW5lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWth
cyBKdWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4KCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
