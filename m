From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 02/12] Makefile: build and use new DSDT
 table for Q35
Date: Tue, 20 Mar 2018 00:10:09 +1000
Message-ID: <20180320001009.0000001e@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <cover.1520867740.git.x1917x@gmail.com>
 <63cd205c8eb8b48f0609ae35dcdc246426a2371e.1520867740.git.x1917x@gmail.com>
 <5AAFC42602000078001B36D1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zqd6=gj=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1exvUS-00068z-F0
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 14:10:20 +0000
Received: by mail-lf0-x234.google.com with SMTP id o102-v6so3081024lfg.8
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 07:10:18 -0700 (PDT)
In-Reply-To: <5AAFC42602000078001B36D1@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBNYXIgMjAxOCAwNzowNzozNCAtMDYwMAoiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IE9uIDEyLjAzLjE4IGF0IDE5OjMzLCA8eDE5MTd4QGdt
YWlsLmNvbT4gd3JvdGU6ICAKPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2Vm
aWxlCj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9NYWtlZmlsZQo+PiBAQCAtNzUs
NyArNzUsNyBAQCByb21iaW9zLm86IHJvbXMuaW5jCj4+ICBzbWJpb3MubzogQ0ZMQUdTICs9IC1E
X19TTUJJT1NfREFURV9fPSJcIiQoU01CSU9TX1JFTF9EQVRFKVwiIgo+PiAgCj4+ICBBQ1BJX1BB
VEggPSAuLi8uLi9saWJhY3BpCj4+IC1EU0RUX0ZJTEVTID0gZHNkdF9hbnljcHUuYyBkc2R0XzE1
Y3B1LmMgZHNkdF9hbnljcHVfcWVtdV94ZW4uYwo+PiArRFNEVF9GSUxFUyA9IGRzZHRfYW55Y3B1
LmMgZHNkdF8xNWNwdS5jIGRzZHRfYW55Y3B1X3FlbXVfeGVuLmMKPj4gZHNkdF9xMzVfYW55Y3B1
X3FlbXVfeGVuLmMgIAo+Cj5Vbmxlc3MgeW91IGludGVuZCB0byBhZGQgYSBzZWNvbmQgZmxhdm9y
LCBwbGVhc2Ugb21pdCB0aGUgImFueWNwdSIKPnBhcnQgZnJvbSB0aGUgbmFtZSBvZiB0aGUgbmV3
IGluc3RhbmNlLgoKSnVzdCBmb2xsb3dpbmcgc2FtZSAiYW55Y3B1LzE1Y3B1IiBuYW1pbmcgc2No
ZW1lLCB0aGVyZSB3aWxsIGJlIG5vIG5lZWQKZm9yIGRzZHRfcTM1XzE1Y3B1LmMsIHNvIEkgZ3Vl
c3MgaXRzIG9rIHRvIGRyb3AgYW55Y3B1LzE1Y3B1IHBhcnQgb2YKdGhlIG5hbWUsIHdpbGwgcmVu
YW1lIGl0LgoKPj4gQEAgLTU2LDYgKzU2LDEzIEBAICQoQUNQSV9CVUlMRF9ESVIpL2RzZHRfYW55
Y3B1X3FlbXVfeGVuLmFzbDoKPj4gZHNkdC5hc2wgZHNkdF9hY3BpX2luZm8uYXNsICQoTUtfRFNE
ICQoTUtfRFNEVCkgLS1kZWJ1Zz0kKGRlYnVnKQo+PiAtLWRtLXZlcnNpb24gcWVtdS14ZW4gPj4g
JEAuJChUTVBfU1VGRklYKSBtdiAtZiAkQC4kKFRNUF9TVUZGSVgpICRACj4+ICAKPj4gKyQoQUNQ
SV9CVUlMRF9ESVIpL2RzZHRfcTM1X2FueWNwdV9xZW11X3hlbi5hc2w6IGRzZHRfcTM1LmFzbAo+
PiBkc2R0X2FjcGlfaW5mby5hc2wgJChNS19EU0RUKQo+PiArCSMgUmVtb3ZlIGxhc3QgYnJhY2tl
dAo+PiArCWF3ayAnTlIgPiAxIHtwcmludCBzfSB7cz0kJDB9JyAkPCA+ICRALiQoVE1QX1NVRkZJ
WCkKPj4gKwljYXQgZHNkdF9hY3BpX2luZm8uYXNsID4+ICRALiQoVE1QX1NVRkZJWCkKPj4gKwkk
KE1LX0RTRFQpIC0tZGVidWc9JChkZWJ1ZykgLS1kbS12ZXJzaW9uIHFlbXUteGVuID4+Cj4+ICRA
LiQoVE1QX1NVRkZJWCkKPj4gKwltdiAtZiAkQC4kKFRNUF9TVUZGSVgpICRAICAKPgo+VGhlIGNv
bW1hbmRzIGxvb2sgdG8gYmUgZXhhY3RseSB0aGUgc2FtZSBhcyB0aG9zZSBmb3IKPmRzZHRfYW55
Y3B1X3FlbXVfeGVuLmFzbCAtIHBsZWFzZSBsZXQncyBub3QgZHVwbGljYXRlIHN1Y2gKPnRoaW5n
cywgYnV0IGluc3RlYWQgdXNlIGEgcGF0dGVybiBydWxlLgoKQWdyZWUsIHJldXNpbmcgdGhlIHJ1
bGUgd2lsbCBiZSBiZXR0ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
