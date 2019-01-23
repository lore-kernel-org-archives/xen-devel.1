From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] xen/arm: gic: Make sure the number
 of interrupt lines is valid before using it
Date: Wed, 23 Jan 2019 14:36:06 +0100
Message-ID: <84f1faab-5827-5002-b585-8bee7908f165@suse.com>
References: <20181130171533.18123-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1901221520260.17936@sstabellini-ThinkPad-X260>
 <185cfa6d-81be-b7b6-c9eb-5a420159a4d7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l+rE=P7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmIhO-0004uj-6s
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:36:10 +0000
In-Reply-To: <185cfa6d-81be-b7b6-c9eb-5a420159a4d7@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan-Peter Larsson <Jan-Peter.Larsson@arm.com>, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxNDoyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ICgrIEp1ZXJnZW4pCj4g
Cj4gSGkgSnVlcmdlbiwKPiAKPiBPbiAyMi8wMS8yMDE5IDIzOjIyLCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6Cj4+IE9uIEZyaSwgMzAgTm92IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
IEdJQ3YyIGFuZCBHSUN2MyBzdXBwb3J0cyB1cCB0byAxMDIwIGludGVycnVwdHMuIEhvd2V2ZXIs
IHRoZSB2YWx1ZQo+Pj4gY29tcHV0ZWQKPj4+IGZyb20gR0lDRF9UWVBFUi5JVExpbmVzTnVtYmVy
IGNhbiBiZSB1cCB0byAxMDI0LiBPbiBHSUN2Mywgd2Ugd2lsbAo+Pj4gZW5kIHVwIHRvCj4+PiB3
cml0ZSBpbiByZXNlcnZlZCByZWdpc3RlcnMgdGhhdCBhcmUgcmlnaHQgYWZ0ZXIgdGhlIElST1VU
RVJzIG9uZSBhcyB0aGUKPj4+IHZhbHVlIGlzIG5vdCBjYXBwZWQgZWFybHkgZW5vdWdoLgo+Pj4K
Pj4+IENhcCB0aGUgbnVtYmVyIG9mIGludGVycnVwdHMgYXMgc29vbiBhcyB3ZSBjb21wdXRlIGl0
IHNvIHdlIGtub3cgd2UgY2FuCj4+PiBzYWZlbHkgdXNpbmcgaXQgYWZ0ZXJ3YXJkcy4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4g
UmVwb3J0ZWQtYnk6IEphbi1QZXRlciBMYXJzc29uIDxKYW4tUGV0ZXIuTGFyc3NvbkBhcm0uY29t
Pgo+Pgo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgo+IAo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGdpdmUgYW4gUkFCIGZvciB0aGlz
IHBhdGNoPwoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
