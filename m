From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
Date: Tue, 7 May 2019 16:58:35 +0100
Message-ID: <2ebfaefc-24d1-d5d0-093c-35684afc846d@arm.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-5-git-send-email-olekstysh@gmail.com>
 <0ca6089f-da23-a3a6-3b88-df2e99c0d5eb@arm.com>
 <30269399-069c-617f-991f-a37899ed2008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO2UJ-0004UW-SU
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:58:39 +0000
In-Reply-To: <30269399-069c-617f-991f-a37899ed2008@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzMwLzE5IDEyOjAwIFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMjkuMDQu
MTkgMTc6MjksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgT2xla3NhbmRyLAo+IAo+IEhpIEp1
bGllbgo+IAo+IAo+Pgo+Pj4gLS0tCj4+PiDCoCBkb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50
eHTCoMKgwqAgfMKgIDYgKysrKysrCj4+PiDCoCB4ZW4vYXJjaC9hcm0vUnVsZXMubWvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKysrKwo+Pj4gwqAgeGVuL2FyY2gvYXJtL2FybTMy
L2RlYnVnLXNjaWYuaW5jIHwgMTMgKysrKysrKysrLS0tLQo+Pj4gwqAgMyBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9k
b2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQgCj4+PiBiL2RvY3MvbWlzYy9hcm0vZWFybHkt
cHJpbnRrLnR4dAo+Pj4gaW5kZXggYjIzYzU0Zi4uYzA1NDY3NCAxMDA2NDQKPj4+IC0tLSBhL2Rv
Y3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+Pj4gKysrIGIvZG9jcy9taXNjL2FybS9lYXJs
eS1wcmludGsudHh0Cj4+PiBAQCAtMjcsNiArMjcsMTIgQEAgCj4+PiBDT05GSUdfRUFSTFlfUFJJ
TlRLPTxJTkM+LDxCQVNFX0FERFJFU1M+LDxPVEhFUl9PUFRJT05TPgo+Pj4gwqDCoMKgwqDCoMKg
wqAgSWYgPEJBVURfUkFURT4gaXMgbm90IGdpdmVuIHRoZW4gdGhlIGNvZGUgd2lsbCBub3QgdHJ5
IHRvCj4+PiDCoMKgwqDCoMKgwqDCoCBpbml0aWFsaXplIHRoZSBVQVJULCBzbyB0aGF0IGJvb3Rs
b2FkZXIgb3IgZmlybXdhcmUgc2V0dGluZ3MgY2FuCj4+PiDCoMKgwqDCoMKgwqAgYmUgdXNlZCBm
b3IgbWF4aW11bSBjb21wYXRpYmlsaXR5Lgo+Pj4gK8KgIC0gc2NpZiw8QkFTRV9BRERSRVNTPiw8
VkVSU0lPTj4KPj4+ICvCoMKgwqAgLSA8VkVSU0lPTj4gaXMgYSBvcHRpb24gdG8gY2hvb3NlIHdo
aWNoIGludGVyZmFjZSB2ZXJzaW9uIHNob3VsZCAKPj4+IGJlIHVzZWQKPj4KPj4gQnkgImEgb3B0
aW9uIiBkaWQgeW91IGludGVuZCB0byBtZWFuIGl0IGlzIGFuIG9wdGlvbmFsIHBhcmFtZXRlcj8K
Pj4KPj4gSWYgc28sIGhvdyBhYm91dDoKPj4KPj4gIlNDSUY8VkVSU0lPTj4gaXMsIG9wdGlvbmFs
bHksIHRoZSBpbnRlcmZhY2UgdmVyc2lvbiBvZiB0aGUgVUFSVC4iCj4gCj4gYWdyZWUuIHdpbGwg
Y2hhbmdlLgo+IAo+IAo+Pgo+PiBTbyB5b3Ugd291bGQgYWxzbyBwcm92aWRlIGEgd2F5IGZvciB0
aGUgdXNlciB0byBrbm93IGhvdyB0byBzcGVjaWZ5IAo+PiBpdC4gU3RlZmFubyBhbnkgb3Bpbmlv
bj8KPiAKPiBJIGFtIGdvaW5nIHRvIHVwZGF0ZSBXaWtpIHBhZ2UgcmVnYXJkaW5nIGhvdyB0byBy
dW4gU3RvdXQgYm9hcmQgb24gWGVuIAo+IGFuZCBob3cgdG8gcHJvcGVybHkgZW5hYmxlIGVhcmx5
cHJpbnRrIHN1cHBvcnQgb24gdGhhdCBib2FyZC4KCk15IHBvaW50IHdhcyBub3QgYWRkaW5nIG5l
dyBhbGlhcyAoSSBhbSBub3QgaW4gZmF2b3IgYW55d2F5KSwgYnV0IGdpdmluZyAKaGludCB0byB0
aGUgdXNlciBob3cgaW5mZXIgdGhlIHZhbHVlIG9mIDxWRVJTSU9OPi4KClRoZSB3aWtpIHBhZ2Ug
Zm9yIHRoZSBib2FyZCBjYW4gdGhlbiBleHBsYWluIGEgYml0IG1vcmUgaW50byBkZXRhaWxzIGhv
dyAKdG8gc2V0dXAgZWFybHlwcmludGsuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
