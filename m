From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/3] xen: add CONFIG item for default
 dom0 memory size
Date: Fri, 18 Jan 2019 14:19:16 +0100
Message-ID: <37d17bc3-0fe8-44eb-51dd-b2a764c6a323@suse.com>
References: <20181210114422.27275-1-jgross@suse.com>
 <20181210114422.27275-4-jgross@suse.com>
 <e534b651-5d0b-34fb-0f79-9f02ce6d91c4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I88E=P2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gkU4K-0003BJ-Oq
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 13:20:20 +0000
In-Reply-To: <e534b651-5d0b-34fb-0f79-9f02ce6d91c4@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMjAxOSAxNDoxMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8xMi8yMDE4
IDExOjQ0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXaXRoIGJlaW5nIGFibGUgdG8gc3BlY2lm
eSBhIGRvbTBfbWVtIHZhbHVlIGRlcGVuZGluZyBvbiBob3N0IG1lbW9yeQo+PiBzaXplIG9uIHg4
NiBtYWtlIGl0IGVhc3kgZm9yIGRpc3Ryb3MgdG8gc3BlY2lmeSBhIGRlZmF1bHQgZG9tMCBzaXpl
IGJ5Cj4+IGFkZGluZyBhIENPTkZJR19ET00wX01FTSBpdGVtIHdoaWNoIHByZXNldHMgdGhlIGRv
bTBfbWVtIGJvb3QgcGFyYW1ldGVyCj4+IHZhbHVlLgo+Pgo+PiBJdCB3aWxsIGJlIHVzZWQgb25s
eSBpZiBubyBkb20wX21lbSBwYXJhbWV0ZXIgd2FzIHNwZWNpZmllZCBpbiB0aGUKPj4gYm9vdCBw
YXJhbWV0ZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Cj4gV2h5IHdhcyB0aGlzIHBhdGNoIGFjY2VwdGVkP8KgIFdlJ3ZlIGFscmVhZHkgZ290IGEgc3Vp
dGFibGUgS2NvbmZpZwo+IG9wdGlvbiBmb3IgdGhpcywgQ09ORklHX0NNRExJTkUuCgpXaHkgZG8g
d2UgaGF2ZSBhIGNvbmZpZyBvcHRpb24gZm9yIHRoZSBkZWZhdWx0IHNjaGVkdWxlcj8KCkFuZCBz
b21ldGhpbmcgbGlrZToKCmRvbTBfbWVtPW1heDo4RyBkb20wX21lbT0xMCUKCmlzIGRpZmZlcmVu
dCBmcm9tCgpDT05GSUdfRE9NMF9NRU09Im1heDo4RyIgcGx1cyBkb20wX21lbT0xMCUKCm9uIGEg
aG9zdCB3aXRoIHNheSAxMDBHIG9mIG1lbW9yeTogSW4gdGhlIGZpcnN0IGNhc2UgdGhpcyB3b3Vs
ZCBiZSA4RywKaW4gdGhlIHNlY29uZCBjYXNlIDEwRy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
