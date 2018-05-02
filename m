From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/4] xen/PVH: Use proper CS selector in long
 mode
Date: Wed, 2 May 2018 11:08:53 -0400
Message-ID: <cb819dcb-1597-680e-31b3-b63fecb6d4c1__1680.46428957513$1525273493$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-3-boris.ostrovsky@oracle.com>
 <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
 <6b7a748d-e289-c370-123a-678c6ad7d9dd@oracle.com>
 <5AE9D27402000078001C02ED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rpbp=hv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDtKY-0007kd-JM
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:06:06 +0000
In-Reply-To: <5AE9D27402000078001C02ED@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOCAxMTowMCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDUu
MTggYXQgMTY6NTcsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDA1
LzAyLzIwMTggMDQ6MDUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDQuMTgg
YXQgMTg6MjMsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pgo+Pj4gQnV0
IHRvIHVuZGVyc3RhbmQgd2h5IHRoaW5ncyBoYXZlIGJlZW4gd29ya2luZyBuZXZlcnRoZWxlc3Mg
aXQgd291bGQKPj4+IGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBjb21taXQgbWVzc2FnZSB3YXNuJ3Qg
ZW1wdHksIGJ1dCBpbnN0ZWFkIHNhaWQKPj4+IHNvbWV0aGluZyBsaWtlICJUaGUgdHdvIGhhcHBl
biB0byBiZSBpZGVudGljYWwgb24gNjQtYml0LiIKPj4KPj4gV2h5IGRvIHlvdSB0aGluayB0aGV5
IGFyZSBpZGVudGljYWw/IF9fS0VSTkVMX0NTIHBvaW50cyB0byBlbnRyeSMxMgo+PiAod2hpY2gg
d2UgZG9uJ3Qgc3BlY2lmeSBpbiBQVkggR0RUKSB3aGlsZSBfX0JPT1RfQ1MgaXMgdGhlIHNlY29u
ZCBlbnRyeQo+PiAod2hpY2ggd2UgZG8gY3JlYXRlKS4KPiBUaGF0J3MgMzItYml0J3MgX19LRVJO
RUxfQ1MuIElmIHRoZSB0d28gd2VyZW4ndCBpZGVudGljYWwsIHRoZSBsam1wCj4geW91IGFkanVz
dCB3b3VsZCBuZXZlciBoYXZlIHdvcmtlZCBhZmFpY3QuCgoKT2gsIHJpZ2h0LiBNeSB0aGVvcnkg
d2FzIHRoYXQgd2Ugd2VyZSBwaWNraW5nIHVwIHNvbWV0aGluZyBmcm9tIHRoZQpzdGFjayAod2hp
Y2ggaXMgd2hlcmUgMTJ0aCBlbnRyeSB3b3VsZCBiZSBwb2ludGluZykgYW5kIHRoZSBMIGJpdCwg
d2hpY2gKSSB0aGluayBpcyB0aGUgb25seSBvbmUgd2UnZCBjYXJlIGFib3V0LCBoYXBwZW5lZCB0
byBhbHdheXMgYmUgc2V0IHRoZXJlLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
