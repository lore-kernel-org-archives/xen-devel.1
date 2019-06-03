From: Juergen Gross <jgross@suse.com>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Mon, 3 Jun 2019 15:10:55 +0200
Message-ID: <d3358f62-3e53-4468-782c-7b4466d34c0a__3225.28707781515$1559567519$gmane$org@suse.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com> <1559563359.24330.8.camel@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E8iV=UC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hXmjr-00008X-Kk
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:10:59 +0000
In-Reply-To: <1559563359.24330.8.camel@codethink.co.uk>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>, Greg KH <greg@kroah.com>
Cc: Prarit Bhargava <prarit@redhat.com>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDYvMjAxOSAxNDowMiwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPiBPbiBNb24sIDIwMTkt
MDYtMDMgYXQgMTA6MDAgKzAyMDAsIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIFRodSwgTWF5IDMwLCAy
MDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPj4+
IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPj4+PiBJJ20gbG9va2lu
ZyBhdCBDVkUtMjAxNS04NTUzIHdoaWNoIGlzIGZpeGVkIGJ5Ogo+Pj4+Cj4+Pj4gY29tbWl0IDc2
ODFmMzFlYzljZGFjYWI0ZmQxMDU3MGJlOTI0ZjJjZWY2NjY5YmEKPj4+PiBBdXRob3I6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4+PiBEYXRlOsKgwqDC
oFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoHhlbi9w
Y2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2UgcmVzZXQuCj4+
Pj4KPj4+PiBJJ20gYXdhcmUgdGhhdCB0aGlzIGNoYW5nZSBpcyBpbmNvbXBhdGlibGUgd2l0aCBx
ZW11IDwgMi41LCBidXQgdGhhdCdzCj4+Pj4gbm93IHF1aXRlIG9sZC7CoMKgRG8geW91IHRoaW5r
IGl0IG1ha2VzIHNlbnNlIHRvIGFwcGx5IHRoaXMgY2hhbmdlIHRvCj4+Pj4gc29tZSBzdGFibGUg
YnJhbmNoZXM/Cj4+Pj4KPj4+PiBCZW4uCj4+Pj4KPj4+Cj4+PiBIZXkgQmVuLAo+Pj4KPj4+IDxz
aHJ1Z3M+IE15IG9waW5pb24gaXMgdG8gZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0
IG1ha2VzIHNlbnNlIHRvCj4+PiBiYWNrcG9ydCBJIGFtIG5vdCBnb2luZyB0byBhcmd1ZS4KPj4K
Pj4gT2ssIEkndmUgcXVldWVkIHRoaXMgdXAgbm93LCB0aGFua3MuCj4gCj4gSnVlcmdlbiBzYWlk
Ogo+IAo+PiBJJ20gd2l0aCBLb25yYWQgaGVyZS4KPiAKPiBzbyB1bmxlc3MgSSdtIHZlcnkgY29u
ZnVzZWQgdGhpcyBzaG91bGQgKm5vdCogYmUgYXBwbGllZCB0byBzdGFibGUKPiBicmFuY2hlcy4K
CiJzaG91bGQgbm90IiBpcyBhIGxpdHRsZSBiaXQgaGFyZC4gSSBkaWRuJ3Qgb3B0IGZvciBhZGRp
bmcgaXQsIGJ1dCBJCmRvbid0IG9iamVjdCB0byBhZGQgaXQgZWl0aGVyIChsaWtlIEtvbnJhZCA6
LSkgKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
