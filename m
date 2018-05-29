From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Tue, 29 May 2018 08:23:51 -0600
Message-ID: <5B0D627702000078001C6A9E@prv1-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com><cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyld=iq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNfXY-0002Q8-Sj
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 14:23:56 +0000
In-Reply-To: <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE4IGF0IDE5OjMzLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gLS0t
IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4gKysrIGIvdG9vbHMvZmlybXdh
cmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4gQEAgLTUzLDEwICs1MywxNCBAQCBleHRlcm4gdWludDhf
dCBpb2FwaWNfdmVyc2lvbjsKPiAgI2RlZmluZSBQQ0lfSVNBX0RFVkZOICAgICAgIDB4MDggICAg
LyogZGV2IDEsIGZuIDAgKi8KPiAgI2RlZmluZSBQQ0lfSVNBX0lSUV9NQVNLICAgIDB4MGMyMFUg
LyogSVNBIElSUXMgNSwxMCwxMSBhcmUgUENJIGNvbm5lY3RlZCAqLwo+ICAjZGVmaW5lIFBDSV9J
Q0g5X0xQQ19ERVZGTiAgMHhmOCAgICAvKiBkZXYgMzEsIGZuIDAgKi8KPiArI2RlZmluZSBQQ0lf
TUNIX0RFVkZOICAgICAgIDAgICAgICAgLyogYnVzIDAsIGRldiAwLCBmdW5jIDAgKi8KCkp1c3Qg
TUNIIGlzIGxpYWJsZSB0byBiZWNvbWUgYW1iaWd1b3VzIGluIHRoZSBmdXR1cmUuIFBlcmhhcHMg
UENJX1EzNV9NQ0hfREVWRk4/Cgo+IEBAIC0xNzIsMTAgKzE3MywxNCBAQCB2b2lkIHBjaV9zZXR1
cCh2b2lkKQo+ICAKPiAgICAgIC8qIENyZWF0ZSBhIGxpc3Qgb2YgZGV2aWNlIEJBUnMgaW4gZGVz
Y2VuZGluZyBvcmRlciBvZiBzaXplLiAqLwo+ICAgICAgc3RydWN0IGJhcnMgewo+IC0gICAgICAg
IHVpbnQzMl90IGlzXzY0YmFyOwo+ICAgICAgICAgIHVpbnQzMl90IGRldmZuOwo+ICAgICAgICAg
IHVpbnQzMl90IGJhcl9yZWc7Cj4gICAgICAgICAgdWludDY0X3QgYmFyX3N6Owo+ICsgICAgICAg
IHVpbnQ2NF90IGFkZHJfbWFzazsgLyogd2hpY2ggYml0cyBvZiB0aGUgYmFzZSBhZGRyZXNzIGNh
biBiZSB3cml0dGVuICovCj4gKyAgICAgICAgdWludDMyX3QgYmFyX2RhdGE7ICAvKiBpbml0aWFs
IHZhbHVlIC0gQkFSIGZsYWdzIGhlcmUgKi8KCldoeSAzMiBiaXRzPyBZb3Ugb25seSB1c2UgdGhl
IGxvdyBmZXcgb25lcyBhZmFpY3MuIEFsc28gcGxlYXNlIGF2b2lkIGZpeGVkIHdpZHRoCnR5cGVz
IHVubGVzcyB5b3UgcmVhbGx5IG5lZWQgdGhlbS4KCj4gQEAgLTI1OSwxMyArMjY0LDIxIEBAIHZv
aWQgcGNpX3NldHVwKHZvaWQpCj4gICAgICAgICAgICAgICAgICBiYXJfcmVnID0gUENJX1JPTV9B
RERSRVNTOwo+ICAKPiAgICAgICAgICAgICAgYmFyX2RhdGEgPSBwY2lfcmVhZGwoZGV2Zm4sIGJh
cl9yZWcpOwo+ICsKPiArICAgICAgICAgICAgaXNfbWVtID0gISEoKChiYXJfZGF0YSAmIFBDSV9C
QVNFX0FERFJFU1NfU1BBQ0UpID09Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgUENJX0JBU0Vf
QUREUkVTU19TUEFDRV9NRU1PUlkpIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgKGJhcl9y
ZWcgPT0gUENJX1JPTV9BRERSRVNTKSk7CgpPbmNlIHlvdSBtYWtlIGlzX21lbSBwcm9wZXJseSBi
b29sLCAhISB3b24ndCBiZSBuZWVkZWQgYW55bW9yZS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
