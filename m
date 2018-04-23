From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Mon, 23 Apr 2018 18:41:41 -0400
Message-ID: <ce2ebb5b-fa13-0475-b0fd-6c330277d151__6763.96177518672$1524523155$gmane$org@oracle.com>
References: <5d8fec7f-956c-378f-be90-f45029385740@gmail.com>
 <20180416192905.GA18096@downor-Z87X-UD5H>
 <20180417075928.GT31310@phenom.ffwll.local>
 <20180417205744.GA15930@downor-Z87X-UD5H>
 <41487acb-a67a-8933-d0c3-702c19b0938e@gmail.com>
 <20180418073508.ptvntwedczpvl7bx@MacBook-Pro-de-Roger.local>
 <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <20180420071914.GG31310@phenom.ffwll.local>
 <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
 <20180423115242.ywdwqblj2aseu3fr@citrix.com>
 <61105351-8896-072b-abf0-757c7f6c0edf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjvb=hm=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fAk7x-0001ds-TV
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 22:40:05 +0000
In-Reply-To: <61105351-8896-072b-abf0-757c7f6c0edf@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Wei Liu <wei.liu2@citrix.com>
Cc: jgross@suse.com, Artem Mygaiev <Artem_Mygaiev@epam.com>, Dongwon Kim <dongwon.kim@intel.com>, airlied@linux.ie, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjMvMjAxOCAwODoxMCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDQvMjMvMjAxOCAwMjo1MiBQTSwgV2VpIExpdSB3cm90ZToKPj4gT24gRnJpLCBBcHIgMjAs
IDIwMTggYXQgMDI6MjU6MjBQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4+Pj4+IMKgwqDCoMKgIHRoZSBnbnRkZXYuCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBn
ZW5lcmljIGVub3VnaCB0aGF0IGl0IGNvdWxkIGJlIGltcGxlbWVudGVkIGJ5IGEKPj4+Pj4gZGV2
aWNlIG5vdCB0aWVkIHRvIFhlbi4gQUZBSUNUIHRoZSBoeXBlcl9kbWEgZ3V5cyBhbHNvIHdhbnRl
ZAo+Pj4+PiBzb21ldGhpbmcgc2ltaWxhciB0byB0aGlzLgo+Pj4+IFlvdSBjYW4ndCBqdXN0IHdy
YXAgcmFuZG9tIHVzZXJzcGFjZSBtZW1vcnkgaW50byBhIGRtYS1idWYuIFdlJ3ZlCj4+Pj4ganVz
dCBoYWQKPj4+PiB0aGlzIGRpc2N1c3Npb24gd2l0aCBrdm0vcWVtdSBmb2xrcywgd2hvIHByb3Bv
c2VkIGp1c3QgdGhhdCwgYW5kCj4+Pj4gYWZ0ZXIgYQo+Pj4+IGJpdCBvZiBkaXNjdXNzaW9uIHRo
ZXknbGwgbm93IHRyeSB0byBoYXZlIGEgZHJpdmVyIHdoaWNoIGp1c3Qgd3JhcHMgYQo+Pj4+IG1l
bWZkIGludG8gYSBkbWEtYnVmLgo+Pj4gU28sIHdlIGhhdmUgdG8gZGVjaWRlIGVpdGhlciB3ZSBp
bnRyb2R1Y2UgYSBuZXcgZHJpdmVyCj4+PiAoc2F5LCB1bmRlciBkcml2ZXJzL3hlbi94ZW4tZG1h
LWJ1Zikgb3IgZXh0ZW5kIHRoZSBleGlzdGluZwo+Pj4gZ250ZGV2L2JhbGxvb24gdG8gc3VwcG9y
dCBkbWEtYnVmIHVzZS1jYXNlcy4KPj4+Cj4+PiBDYW4gYW55Ym9keSBmcm9tIFhlbiBjb21tdW5p
dHkgZXhwcmVzcyB0aGVpciBwcmVmZXJlbmNlIGhlcmU/Cj4+Pgo+PiBPbGVrc2FuZHIgdGFsa2Vk
IHRvIG1lIG9uIElSQyBhYm91dCB0aGlzLCBoZSBzYWlkIGEgZmV3IElPQ1RMcyBuZWVkIHRvCj4+
IGJlIGFkZGVkIHRvIGVpdGhlciBleGlzdGluZyBkcml2ZXJzIG9yIGEgbmV3IGRyaXZlci4KPj4K
Pj4gSSB3ZW50IHRocm91Z2ggdGhpcyB0aHJlYWQgdHdpY2UgYW5kIHNraW1tZWQgdGhyb3VnaCB0
aGUgcmVsZXZhbnQKPj4gZG9jdW1lbnRzLCBidXQgSSBjb3VsZG4ndCBzZWUgYW55IG9idmlvdXMg
cHJvcyBhbmQgY29ucyBmb3IgZWl0aGVyCj4+IGFwcHJvYWNoLiBTbyBJIGRvbid0IHJlYWxseSBo
YXZlIGFuIG9waW5pb24gb24gdGhpcy4KPj4KPj4gQnV0LCBhc3N1bWluZyBpZiBpbXBsZW1lbnRl
ZCBpbiBleGlzdGluZyBkcml2ZXJzLCB0aG9zZSBJT0NUTHMgbmVlZCB0bwo+PiBiZSBhZGRlZCB0
byBkaWZmZXJlbnQgZHJpdmVycywgd2hpY2ggbWVhbnMgdXNlcnNwYWNlIHByb2dyYW0gbmVlZHMg
dG8KPj4gd3JpdGUgbW9yZSBjb2RlIGFuZCBnZXQgbW9yZSBoYW5kbGVzLCBpdCB3b3VsZCBiZSBz
bGlnaHRseSBiZXR0ZXIgdG8KPj4gaW1wbGVtZW50IGEgbmV3IGRyaXZlciBmcm9tIHRoYXQgcGVy
c3BlY3RpdmUuCj4gSWYgZ250ZGV2L2JhbGxvb24gZXh0ZW5zaW9uIGlzIHN0aWxsIGNvbnNpZGVy
ZWQ6Cj4KPiBBbGwgdGhlIElPQ1RMcyB3aWxsIGJlIGluIGdudGRldiBkcml2ZXIgKGluIGN1cnJl
bnQgeGVuLXpjb3B5Cj4gdGVybWlub2xvZ3kpOgo+IMKgLSBEUk1fSUNPVExfWEVOX1pDT1BZX0RV
TUJfRlJPTV9SRUZTCj4gwqAtIERSTV9JT0NUTF9YRU5fWkNPUFlfRFVNQl9UT19SRUZTCj4gwqAt
IERSTV9JT0NUTF9YRU5fWkNPUFlfRFVNQl9XQUlUX0ZSRUUKPgo+IEJhbGxvb24gZHJpdmVyIGV4
dGVuc2lvbiwgd2hpY2ggaXMgbmVlZGVkIGZvciBjb250aWd1b3VzL0RNQQo+IGJ1ZmZlcnMsIHdp
bGwgYmUgdG8gcHJvdmlkZSBuZXcgKmtlcm5lbCBBUEkqLCBubyBVQVBJIGlzIG5lZWRlZC4KPgoK
ClNvIEkgYW0gb2J2aW91c2x5IGEgYml0IGxhdGUgdG8gdGhpcyB0aHJlYWQsIGJ1dCB3aHkgZG8g
eW91IG5lZWQgdG8gYWRkCm5ldyBpb2N0bHMgdG8gZ250ZGV2IGFuZCBiYWxsb29uPyBEb2Vzbid0
IHRoaXMgZHJpdmVyIG1hbmFnZSB0byBkbyB3aGF0CnlvdSB3YW50IHdpdGhvdXQgYW55IGV4dGVu
c2lvbnM/CgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
