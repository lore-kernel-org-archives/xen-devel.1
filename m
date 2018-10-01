From: Julien Grall <julien.grall@arm.com>
Subject: Re: [[PATCH v3] 4/4] xen/arm: Replace call_smc with
 arm_smccc_smc
Date: Mon, 1 Oct 2018 21:57:06 +0100
Message-ID: <a058f129-fb92-3424-a38f-0a17c8993213@arm.com>
References: <20181001124639.22885-1-julien.grall@arm.com>
 <20181001124639.22885-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1810011300390.25821@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1810011349000.25821@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1810011349000.25821@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: volodymyr_babchuk@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzAxLzIwMTggMDk6NTIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBNb24sIDEgT2N0IDIwMTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4g
T24gTW9uLCAxIE9jdCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBjYWxsX3NtYyBpcyBh
IHN1YnNldCBvZiBhcm1fc21jY2Nfc21jLiBSYXRoZXIgdGhhbiBoYXZpbmcgMiBtZXRob2RzIHRv
Cj4+PiBkbyBTTUNDQyBjYWxsLCByZXBsYWNlIGFsbCBjYWxsIHRvIHRoZSBmb3JtZXIgYnkgdGhl
IGxhdGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4+Cj4+ICh5b3UgbWlnaHQgd2FudCB0byBtYWtlIHN1cmUgdGhlIGRv
dWJsZSBbWyBpcyByZW1vdmVkIG9uIGNvbW1pdC4pCj4gCj4gSGV5IEp1bGllbiwKPiAKPiBJIHdh
cyBnb2luZyB0byBjb21taXQgdGhlIHNlcmllcywgYnV0IEkgYW0gZ2V0dGluZyBhIGJ1aWxkIGVy
cm9yOgo+IAo+IHBzY2kuYzogSW4gZnVuY3Rpb24gJ2NhbGxfcHNjaV9jcHVfb24nOgo+IHBzY2ku
Yzo0NTo0MDogZXJyb3I6IHJlcXVlc3QgZm9yIG1lbWJlciAnYTAnIGluIHNvbWV0aGluZyBub3Qg
YSBzdHJ1Y3R1cmUgb3IgdW5pb24KPiAgICNkZWZpbmUgUFNDSV9SRVQocmVzKSAgICgoaW50MzJf
dCkocmVzKS5hMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiBwc2NpLmM6NTQ6MTI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnUFNDSV9SRVQnCj4g
ICAgICAgcmV0dXJuIFBTQ0lfUkVUKHJlcy5hMCk7Cj4gICAgICAgICAgICAgIF4KPiBwc2NpLmM6
NTU6MTogZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQgZnVuY3Rpb24gWy1X
ZXJyb3I9cmV0dXJuLXR5cGVdCj4gICB9CgpJIGFscmVhZHkgbWVudGlvbmVkIHRoaXMgZXJyb3Ig
aW4gcmVwbHkgdG8gdGhlIHBhdGNoIFsxXSBhbmQgc3VnZ2VzdGVkIAppdCBjb3VsZCBiZSBmaXhl
ZCBvbiBjb21taXQuLi4KCkNoZWVycywKClsxXSA8OWUwMTYwYWQtODUzYy02ZWZhLTFhMDQtMTVm
ODAxZWYwNmRhQGFybS5jb20+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
