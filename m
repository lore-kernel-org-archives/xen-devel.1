From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Fri, 22 Feb 2019 04:44:04 -0700
Message-ID: <5C6FE084020000780021916C__22560.8351569221$1550836026$gmane$org@prv1-mh.provo.novell.com>
References: <5e256d9a-572c-e01e-7706-407f99245b00@arm.com>
 <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <1574a7fe-a5ac-4bc2-d3f0-967d8d01e5f1@oracle.com>
 <1100e6b1-6fa8-06f0-8ecc-b0699a2ce5f4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx9HM-0004cT-1S
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:46:08 +0000
In-Reply-To: <1100e6b1-6fa8-06f0-8ecc-b0699a2ce5f4@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave P Martin <dave.martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE5IGF0IDIzOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIvMjAvMTkgOTo0NiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAyLzIwLzE5
IDM6NDYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IE9uIDIvMjAvMTkgODowNCBQTSwgQm9y
aXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+IE9uIDIvMjAvMTkgMTowNSBQTSwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+IFNvbWUgc29ydCBvZiBhIEZJRk8gdGhhdCBzdG9yZXMge2lycSwgZGF0YX0g
dHVwbGUuIEl0IGNvdWxkIG9idmlvdXNseSBiZQo+Pj4+IGltcGxlbWVudGVkIGFzIGEgcmluZyBi
dXQgbm90IG5lY2Vzc2FyaWx5IGFzIFhlbiBzaGFyZWQgcmluZyAoaWYgdGhhdCdzCj4+Pj4gd2hh
dCB5b3Ugd2VyZSByZWZlcnJpbmcgdG8pLgoKSSdtIHNvcnQgb2YgbG9zdCBoZXJlIHdpdGggdGhl
IG1peGVkIHJlZmVyZW5jZXMgdG8gImludGVycnVwdHMiIGFuZAoiZXZlbnRzIi4gSW50ZXJydXB0
cyBjYW4gYmUgc2hhcmVkIChhbmQgaGF2ZSBhIHBlci1pbnN0YW5jZQooaXJxLGRhdGEpIHR1cGxl
KSwgYnV0IHRoZXJlIHNob3VsZCBiZSBhdCBtb3N0IG9uZSBpbnRlcnJ1cHQKdW5kZXJseWluZyB0
aGUgZXZlbnQgY2hhbm5lbCBzeXN0ZW1zLCBzaG91bGRuJ3QgdGhlcmU/IEV2ZW50CmNoYW5uZWxz
IG90b2ggY2FuJ3QgYmUgc2hhcmVkLCBhbmQgaGVuY2UgdGhlcmUncyBvbmx5IG9uZQoiZGF0YSIg
aXRlbSB0byBiZSBhc3NvY2lhdGVkIHdpdGggZWFjaCBjaGFubmVsLCBhdCB3aGljaCBwb2ludCBh
CnBsYWluIGNvdW50ZXIgb3VnaHQgdG8gZG8uCgo+Pj4gVGhlIHVuZGVybHlpbmcgcXVlc3Rpb24g
aXMgd2hhdCBoYXBwZW4gaWYgeW91IG1pc3MgYW4gaW50ZXJydXB0LiBJcyBpdAo+Pj4gZ29pbmcg
dG8gYmUgb2s/Cj4+IAo+PiBUaGlzIEkgYW0gbm90IHN1cmUgYWJvdXQuIEkgdGhvdWdodCB5ZXMg
c2luY2Ugd2UgYXJlIHNpZ25hbGluZyB0aGUKPj4gcHJvY2VzcyBvbmx5IG9uY2UuCj4gCj4gSSBo
YXZlIENDZWQgQW5kcmV3IGFuZCBKYW4gdG8gc2VlIGlmIHRoZXkgY2FuIGhlbHAgaGVyZS4KCldo
YXQgbWVhbmluZyBvZiAibWlzcyIgZG8geW91IHVzZSBoZXJlPyBBcyBsb25nIGFzIGlzIG9ubHkg
bWVhbnMKZGVsYXkgKGkuZS4gbWlzcyBhbiBpbnN0YW5jZSwgYnV0IGdldCBub3RpZmllZCBhcyBz
b29uIGFzIGZlYXNpYmxlCmV2ZW4gaWYgdGhlcmUgaXMgbm90IGZ1cnRoZXIgZXZlbnQgY29taW5n
IGZyb20gdGhlIHNvdXJjZSkgLSB0aGF0CndvdWxkIGJlIG9rYXksIEkgdGhpbmsuIEJ1dCBpZiB5
b3UgdHJ1bHkgbWVhbiAibWlzcyIgKGkuZS4gZXZlbnQgbG9zdAphbHRvZ2V0aGVyLCB3aXRoIHNp
bGVuY2UgcmVzdWx0aW5nIGlmIHRoZXJlJ3Mgbm8gZnVydGhlciBldmVudCksIHRoZW4Kbm8sIHRo
aXMgd291bGQgbm90IGJlIHRvbGVyYWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
