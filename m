From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/6] x86/hvm: Constify the read side of
	vlapic handling
Date: Tue, 27 Feb 2018 14:36:28 +0000
Message-ID: <20180227143628.xu7uig2lsr4ei6zn@MacBook-Pro-de-Roger.local>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519666519-16311-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDU6MzU6MTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIHRvIG1ha2UgaHZtX3gyYXBpY19tc3JfcmVh
ZCgpIHRha2UgYSBjb25zdCB2Y3B1Cj4gcG9pbnRlci4gIE9uZSBtb2RpZmljYXRpb24gaXMgdG8g
YWx0ZXIgdmxhcGljX2dldF90bWNjdCgpIHRvIG5vdCB1c2UgY3VycmVudC4KPiAKPiBUaGlzIGlu
IHR1cm4gbmVlZHMgYW4gYWx0ZXJhdGlvbiB0byBodm1fZ2V0X2d1ZXN0X3RpbWVfZml4ZWQoKSwg
d2hpY2ggaXMgc2FmZQo+IGJlY2F1c2UgdGhlIG9ubHkgbXV0YWJsZSBhY3Rpb24gaXQgbWFrZXMg
aXMgdG8gdGFrZSB0aGUgZG9tYWluIHBsdCBsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IGluZGV4IDE4MWY0Y2IuLjg2MmM3
MTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92cHQuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdnB0LmMKPiBAQCAtMzUsNyArMzUsNyBAQCB2b2lkIGh2bV9pbml0X2d1ZXN0X3Rp
bWUoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgIHBsLT5sYXN0X2d1ZXN0X3RpbWUgPSAwOwo+ICB9
Cj4gIAo+IC11NjQgaHZtX2dldF9ndWVzdF90aW1lX2ZpeGVkKHN0cnVjdCB2Y3B1ICp2LCB1NjQg
YXRfdHNjKQo+ICt1NjQgaHZtX2dldF9ndWVzdF90aW1lX2ZpeGVkKGNvbnN0IHN0cnVjdCB2Y3B1
ICp2LCB1NjQgYXRfdHNjKQoKV2hpbGUgdGhlcmUgeW91IGNvdWxkIHMvdTY0L3VpbnQ2NF90Ly4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
