From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] libxl: get_reaper_lock_and_uid: Document fd
 handling
Date: Mon, 7 Jan 2019 10:42:02 +0000
Message-ID: <D0412FBD-6C60-4DDD-939F-D0942F611526@citrix.com>
References: <20190102120343.21267-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IkhC=PP=citrix.com=prvs=90308b1d5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ggSMB-000603-3d
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:42:07 +0000
In-Reply-To: <20190102120343.21267-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Content-ID: <DA0C9A123087074590C7EE8020E1DDE8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEphbiAyLCAyMDE5LCBhdCAxMDowMyBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IENvdmVyaXR5IHVuZGVyc3RhbmRhYmx5IGNvbXBs
YWlucyB0aGF0IGdldF9yZWFwZXJfbG9ja19hbmRfdWlkIGxlYWtzCj4gdGhlIGZkIGFuZCBoZW5j
ZSBvcGVuLWZpbGUuICBCdXQgdGhpcyBpcyBpbnRlbnRpb25hbDogdGhlIGxvY2sgYmVjb21lcwo+
IG93bmVkIGJ5IHRoZSBjaGlsZCBwcm9jZXNzIGFzIGEgd2hvbGUsIHdoaWNoIGlzIGVudGlyZWx5
IHRoZSBwcm9wZXJ0eQo+IG9mIGxpYnhsLgo+IAo+IChUaGUgY29kaW5nIHN0eWxlIGhlcmUgaW4g
dGhpcyBzdWJwcm9jZXNzIGlzIGEgYml0IGFub21hbG91cyBidXQgaXQncwo+IHByb2JhYmx5IG5v
dCB3b3J0aCBpdCB0byBjb252ZXJ0IGdldF9yZWFwZXJfbG9ja19hbmRfdWlkIHRvIGBnb3RvIG91
dCcKPiBzdHlsZSBhbmQgaGF2ZSBpdCBleHBsaWNpdGx5IHJldHVybiB0aGUgZmQgbnVtYmVyLikK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
