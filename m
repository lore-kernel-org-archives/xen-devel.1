From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/balloon: Mark unallocated host
 memory as UNUSABLE
Date: Tue, 19 Dec 2017 11:08:25 +0100
Message-ID: <334c80f2-92a6-7e24-8cf1-c6472194f813__33340.1872231208$1513678055$gmane$org@suse.com>
References: <1513635771-11779-1-git-send-email-boris.ostrovsky@oracle.com>
 <5A38DA840200007800198579@suse.com>
 <d84d3fa6-f4f3-7312-b5c0-0e774742af95@suse.com>
 <5A38E9A502000078001985CF@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A38E9A502000078001985CF@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, helgaas@kernel.org, christian.koenig@amd.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMTcgMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjEyLjE3IGF0
IDEwOjIxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTkvMTIvMTcgMDk6MjMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMTIuMTcgYXQgMjM6MjIsIDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+Pj4gK3ZvaWQgX19pbml0IGFyY2hfeGVuX2JhbGxv
b25faW5pdChzdHJ1Y3QgcmVzb3VyY2UgKmhvc3RtZW1fcmVzb3VyY2UpCj4+Pj4gK3sKPj4+PiAr
CXN0cnVjdCB4ZW5fbWVtb3J5X21hcCBtZW1tYXA7Cj4+Pj4gKwlpbnQgcmM7Cj4+Pj4gKwl1bnNp
Z25lZCBpbnQgaSwgbGFzdF9ndWVzdF9yYW07Cj4+Pj4gKwlwaHlzX2FkZHJfdCBtYXhfYWRkciA9
IG1heF9wZm4gPDwgUEFHRV9TSElGVDsKPj4+Cj4+PiBQRk5fUEhZUygpIGFzIHJpZ2h0IG5vdyB5
b3Ugc3RpbGwgaGF2ZSBhbiBpc3N1ZSBvbiAzMi1iaXQuCj4+Cj4+IFdoeT8gUEZOX1BIWVMgaXMg
ZGVmaW5lZCBhczoKPj4KPj4gI2RlZmluZSBQRk5fUEhZUyh4KSAoKHBoeXNfYWRkcl90KSh4KSA8
PCBQQUdFX1NISUZUKQo+IAo+IFdlbGwsIHRoYXQncyB3aHkgSSBzdWdnZXN0ZWQgaXRzIHVzZSAo
anVzdCBsaWtlIHlvdSBkaWQgaW4geW91cgo+IG93biByZXZpZXcpLiBJT1cgLSBub3cgSSdtIGNv
bmZ1c2VkLgoKU29ycnksIGp1c3QgZ290IHlvdXIgYW5zd2VyIHdyb25nLgoKQXMgSSBoYWQgYWxy
ZWFkeSBmb3VuZCB0aGUgc2FtZSBpc3N1ZSBzb21laG93IEkgYXNzdW1rZWQgdGhpcyByZW1hcmsK
d291bGQgYmUgcmVmZXJlbmNpbmcgbXkgcmV2aWV3LiBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
