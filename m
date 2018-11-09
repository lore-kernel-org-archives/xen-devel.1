From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 15/15] libxl: Re-implement
 domain_suspend_device_model using libxl__ev_qmp
Date: Fri, 9 Nov 2018 16:59:18 +0000
Message-ID: <20181109165918.GD1302@perard.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-16-anthony.perard@citrix.com>
 <23494.951.777903.157046@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zkit=nu=citrix.com=prvs=8444a692f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gLA7w-0001vo-O5
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 16:59:24 +0000
Content-Disposition: inline
In-Reply-To: <23494.951.777903.157046@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDQ6Mjg6NTVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY1IDE1LzE1XSBsaWJ4bDogUmUt
aW1wbGVtZW50IGRvbWFpbl9zdXNwZW5kX2RldmljZV9tb2RlbCB1c2luZyBsaWJ4bF9fZXZfcW1w
Iik6Cj4gPiArICAgIGlmIChyYykKPiA+ICsgICAgICAgIGdvdG8gZXJyb3I7Cj4gPiArCj4gPiAr
ICAgIGxpYnhsX19jYXJlZmRfYmVnaW4oKTsKPiA+ICsgICAgZXYtPmNmZCA9IGxpYnhsX19jYXJl
ZmRfb3BlbmVkKENUWCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcGVu
KGZpbGVuYW1lLCBPX1dST05MWSB8IE9fQ1JFQVQsIDA2MDApKTsKPiAKPiBEb2VzIHRoaXMgc3Rh
dGVmaWxlIGZkIHJlYWxseSBuZWVkIHRvIGJlIGEgY2FyZWZkID8gIElzIGl0IGEgcGlwZSBvciBh
Cj4gZmlsZSA/ICBJZiBpdCBpcyBhIGZpbGUsIGlzIGl0IG9mIG5vbnRyaXZpYWwgc2l6ZSA/CgpZ
ZXMsIGl0IG5lZWRzIHRvIGJlIGNhcmVkZmQsIGJlY2F1c2UgdGhhdCdzIHdoYXQgdGhlIGxpYnhs
X19ldl9xbXAgQVBJCndhbnRzLiBJIGRvbid0IGtub3cgeWV0IGlmIGl0IGlzIGEgZ29vZCBpZGVl
IHRvIGhhdmUgdGhlIF9ldl9xbXAgQVBJCm9ubHkgdGFrZXMgZmQuIERvIHlvdSB0aGluayBpdCdz
IGZpbmUgdG8gaGF2ZSBsaWJ4bF9fZXZfcW1wIEFQSSB0YWtlcyBhCnNpbXBsZSBmZCBhbmQgbGV0
IGNhbGxlcnMgaGFuZGxlIHRoZSBmZCB0aGUgd2F5IHRoZXkgd2FudD8KCihJbiBwcmV2aW91cyB2
ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMsIGxpYnhsX19ldl9xbXAgdXNlZCB0byBjbG9zZQp0
aGUgY2FyZWZkLiBUaGF0J3Mgbm90IHRoZSBjYXNlIGFueW1vcmUsIGFuZCB0aGF0IGNhcmVmZCBp
cyBvbmx5IHJlYWQsCnNvIEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVyIGFueW1vcmUgd2hpY2gga2lu
ZCBpdCBpcyBiZXR3ZWVuIGludCBhbmQKY2FyZWZkLikKCj4gSWYgaXQncyBhIGZpbGUgb2YgYSBm
ZXcga2IsIHdoaWNoIEkgdGhpbmsgaXMgdGhlIGNhc2UsIHRoZW4gdGhlIHdvcnN0Cj4gcmVzdWx0
IG9mICh3aXRoIHZlcnkgbG93IHByb2JhYmlsaXR5KSBsZWFraW5nIHRoaXMgZmQgaW50byBhbm90
aGVyCj4gcHJvY2VzcyBpcyBzaW1wbHkgdGhhdCB0aGUgZmlsZSBtaWdodCBiZSBrZXB0IGFsaXZl
IGZvciBhIHdoaWxlIGFmdGVyCj4gaXQgd2FzIGRlbGV0ZWQuCgoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
