From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH -next] x86/xen: Fix read buffer overflow
Date: Tue, 18 Dec 2018 09:31:26 +0100
Message-ID: <7825d772-338a-e39e-eaff-73e666ef5c08__28454.1715671823$1545121816$gmane$org@suse.com>
References: <20181218081910.18080-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DuYQ=O3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gZAmp-0007eq-OI
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 08:31:31 +0000
In-Reply-To: <20181218081910.18080-1-yuehaibing@huawei.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTIvMjAxOCAwOToxOSwgWXVlSGFpYmluZyB3cm90ZToKPiBGaXggc21hdGNoIHdhcm5p
bmc6Cj4gCj4gYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jOjY0OSBnZXRfdHJhcF9hZGRyKCkg
ZXJyb3I6Cj4gIGJ1ZmZlciBvdmVyZmxvdyAnZWFybHlfaWR0X2hhbmRsZXJfYXJyYXknIDMyIDw9
IDMyCj4gCj4gRml4ZXM6IDQyYjNhNGNiNTYwOSAoIng4Ni94ZW46IFN1cHBvcnQgZWFybHkgaW50
ZXJydXB0cyBpbiB4ZW4gcHYgZ3Vlc3RzIikKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5
dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+IGluZGV4IDJmNjc4N2YuLjgxZjIwMGQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdi5jCj4gQEAgLTY0Niw3ICs2NDYsNyBAQCBzdGF0aWMgYm9vbCBfX3JlZiBnZXRfdHJh
cF9hZGRyKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBpbnQgaXN0KQo+ICAKPiAgCWlmIChuciA9PSBB
UlJBWV9TSVpFKHRyYXBfYXJyYXkpICYmCj4gIAkgICAgKmFkZHIgPj0gKHZvaWQgKillYXJseV9p
ZHRfaGFuZGxlcl9hcnJheVswXSAmJgo+IC0JICAgICphZGRyIDwgKHZvaWQgKillYXJseV9pZHRf
aGFuZGxlcl9hcnJheVtOVU1fRVhDRVBUSU9OX1ZFQ1RPUlNdKSB7Cj4gKwkgICAgKmFkZHIgPCAo
dm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVyX2FycmF5W05VTV9FWENFUFRJT05fVkVDVE9SUyAtIDFd
KSB7Cj4gIAkJbnIgPSAoKmFkZHIgLSAodm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVyX2FycmF5WzBd
KSAvCj4gIAkJICAgICBFQVJMWV9JRFRfSEFORExFUl9TSVpFOwo+ICAJCSphZGRyID0gKHZvaWQg
Kil4ZW5fZWFybHlfaWR0X2hhbmRsZXJfYXJyYXlbbnJdOwo+IAoKTm8sIHRoaXMgcGF0Y2ggaXMg
d3JvbmcuCgplYXJseV9pZHRfaGFuZGxlcl9hcnJheSBpcyBhIDItZGltZW5zaW9uYWwgYXJyYXk6
Cgpjb25zdCBjaGFyCmVhcmx5X2lkdF9oYW5kbGVyX2FycmF5W05VTV9FWENFUFRJT05fVkVDVE9S
U11bRUFSTFlfSURUX0hBTkRMRVJfU0laRV07CgpTbyBhYm92ZSBjb2RlIGRvZXNuJ3QgZG8gYW4g
b3V0IG9mIGJvdW5kcyBhcnJheSBhY2Nlc3MsIGJ1dCBjaGVja3MgZm9yCiphZGRyIGJlaW5nIGlu
IHRoZSBhcnJheSBvciBvdXRzaWRlIG9mIGl0IChub3RlIHRoZSAiPCIgdXNlZCBmb3IgdGhlCnRl
c3QpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
