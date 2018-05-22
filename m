From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: Re: [External] Re: [RFC PATCH v2 02/12]
 arch/x86/kernel/amd_gart_64: update usage of address zone modifiers
Date: Tue, 22 May 2018 10:17:50 +0000
Message-ID: <HK2PR03MB16847D58C0B62ED73DBD1B2392940__43653.844719711$1526984221$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <1526916033-4877-3-git-send-email-yehs2007@gmail.com>
 <20180522093806.GA25671@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qcm/=ij=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fL4Mr-0002kP-QD
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:18:09 +0000
In-Reply-To: <20180522093806.GA25671@infradead.org>
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "mhocko@suse.com" <mhocko@suse.com>, Huaisheng Ye <yehs2007@gmail.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsing>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogb3duZXItbGludXgtbW1Aa3ZhY2sub3JnIE9uIEJlaGFsZiBPZiBDaHJpc3RvcGggSGVs
bHdpZwo+IAo+IFRoaXMgY29kZSBkb2Vzbid0IGV4aXN0IGluIGN1cnJlbnQgbWFpbmxpbmUuICBX
aGF0IGtlcm5lbCB2ZXJzaW9uCj4gaXMgeW91ciBwYXRjaCBhZ2FpbnN0Pwo+IAo+IE9uIE1vbiwg
TWF5IDIxLCAyMDE4IGF0IDExOjIwOjIzUE0gKzA4MDAsIEh1YWlzaGVuZyBZZSB3cm90ZToKPiA+
IEZyb206IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KPiA+Cj4gPiBVc2UgX19HRlBf
Wk9ORV9NQVNLIHRvIHJlcGxhY2UgKF9fR0ZQX0RNQSB8IF9fR0ZQX0hJR0hNRU0gfCBfX0dGUF9E
TUEzMikuCj4gPgo+ID4gX19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEz
MiBoYXZlIGJlZW4gZGVsZXRlZCBmcm9tIEdGUAo+ID4gYml0bWFza3MsIHRoZSBib3R0b20gdGhy
ZWUgYml0cyBvZiBHRlAgbWFzayBpcyByZXNlcnZlZCBmb3Igc3RvcmluZwo+ID4gZW5jb2RlZCB6
b25lIG51bWJlci4KPiA+IF9fR0ZQX0RNQSwgX19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIg
c2hvdWxkIG5vdCBiZSBvcGVyYXRlZCBieSBPUi4KPiAKPiBJZiB0aGV5IGhhdmUgYWxyZWFkeSBi
ZWVuIGRlbGV0ZWQgdGhlIGlkZW50aWZpZXIgc2hvdWxkIG5vdCBleGlzdAo+IGFueW1vcmUsIHNv
IGVpdGhlciB5b3VyIHBhdGNoIGhhcyBpc3N1ZXMsIG9yIGF0IGxlYXN0IHRoZSBkZXNjcmlwdGlv
bi4KCkRlYXIgQ2hyaXN0b3BoLAoKVGhlIGtlcm5lbCB2ZXJzaW9uIG9mIG15IHBhdGNoZXMgYWdh
aW5zdCBpcyBMaW51eCA0LjE2LCB0aGUgbW9zdCBvZgptb2RpZmljYXRpb25zIGNvbWUgZnJvbSBp
bmNsdWRlL0xpbnV4L2dmcC5oLiBJIHRoaW5rIHRoZXkgc2hvdWxkIGJlCnB1c2hlZCB0byBMaW51
eC1tbSwgc28gSSBmb2xsb3cgdGhlIHJlcXVpcmVtZW50IG9mIG1haW50YWluZXJzIHRvIG1ha2UK
cGF0Y2hlcyBiYXNlZCBvbiBtbW90bS9tYXN0ZXIuCgpJIGp1c3QgY2hlY2tlZCB0aGUgY3VycmVu
dCBtYWlubGluZSwgeWVzLAooX19HRlBfRE1BIHwgX19HRlBfSElHSE1FTSB8IF9fR0ZQX0RNQTMy
KSBoYXMgYmVlbiBkZWxldGVkLCBJIGNhbgpyZWJhc2UgbXkgcGF0Y2hlcyB0byBtYWlubGluZSwg
YW5kIHJlc2VuZCB0aGVtIHRvIG1haWwgbGlzdC4KClNpbmNlcmVseSwKSHVhaXNoZW5nIFllCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
