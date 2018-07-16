From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] x86: (command line option to) avoid use
 of secondary hyper-threads
Date: Mon, 16 Jul 2018 14:01:14 +0100
Message-ID: <a6373e6e-82f9-38ad-b76f-deae848aa462@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F3C702000078001D316D@prv1-mh.provo.novell.com>
 <55886b2f-e5bb-c2c5-b6e5-a5d0c898b876@citrix.com>
 <5B485F0E02000078001D3ABE@prv1-mh.provo.novell.com>
 <4043e550-20d0-11b8-07b7-8274afc96957@citrix.com>
 <5B4C955702000078001D467C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff37v-0004cn-4q
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 13:01:19 +0000
In-Reply-To: <5B4C955702000078001D467C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA3LjE4IGF0
IDE0OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDEzLzA3LzE4
IDA5OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEyLjA3LjE4IGF0IDE3OjQ1LCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTEvMDcvMTggMTM6MTAs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5tYXJrZG93bgo+Pj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93
bgo+Pj4+PiBAQCAtMTA0MCw2ICsxMDQwLDEzIEBAIGlkZW50aWNhbCB0byB0aGUgYm9vdCBDUFUg
d2lsbCBiZSBwYXJrZWQKPj4+Pj4gICMjIyBocGV0YnJvYWRjYXN0ICh4ODYpCj4+Pj4+ICA+IGA9
IDxib29sZWFuPmAKPj4+Pj4gIAo+Pj4+PiArIyMjIGh0ICh4ODYpCj4+Pj4gSSdkIHN1Z2dlc3Qg
c210IHJhdGhlciB0aGFuIGh0IGhlcmUuICBTTVQgaXMgdGhlIHRlY2huaWNhbCB0ZXJtLCB3aGls
ZQo+Pj4+IEhUIGlzIEludGVsJ3MgbWFya2V0aW5nIG5hbWUuCj4+PiBIbW0sIG1hbnkgQklPU2Vz
IChpZiB0aGUgaGF2ZSBzdWNoIGFuIG9wdGlvbikgdGFsayBhYm91dCBIVCwgd2hpY2gKPj4+IHRv
IG1lIG1ha2VzICJodCIgYSBjbG9zZXIgbWF0Y2guIEhvdyBhYm91dCB3ZSBhbGxvdyBib3RoPwo+
PiBUaGF0J3MgYmVjYXVzZSBhIEJJT1MgaXMgY3VzdG9tIHRvIHRoZSBoYXJkd2FyZSBpdCBydW5z
IG9uLgo+Pgo+PiBIYXZlIHlvdSB0cmllZCBzZXR0aW5nIHVwIGFuIGFsaWFzIGJlZm9yZT8gKGdp
dmVuIHRoZSBzcGVjaWZpYwo+PiBkZWZpY2llbmN5IG9mIHRoZSAqX3BhcmFtKCkgaW5mcmFzdHJ1
Y3R1cmUgaW4gdGhpcyBhcmVhKSAgSSdtIGRvbid0Cj4+IHRoaW5rIGFuIGFsaWFzIGlzIHdvcnRo
IHRoZSBlZmZvcnQuCj4gVGhpcyByZWFkcyBhcyBpZiB5b3Ugd2VyZSBleHBlY3RpbmcgcHJvYmxl
bXMuIEluc3RlYWQgb2YKPgo+ICtpbnQ4X3QgX19yZWFkX21vc3RseSBvcHRfaHQgPSAtMTsKPiAr
Ym9vbGVhbl9wYXJhbSgiaHQiLCBvcHRfaHQpOwo+Cj4gd2hhdCB3ZSdkIGhhdmUgaXMgc2ltcGx5
Cj4KPiAraW50OF90IF9fcmVhZF9tb3N0bHkgb3B0X2h0ID0gLTE7Cj4gK2Jvb2xlYW5fcGFyYW0o
Imh0Iiwgb3B0X2h0KTsKPiArYm9vbGVhbl9wYXJhbSgic210Iiwgb3B0X2h0KTsKPgo+IChhbmQg
d2hldGhlciB3ZSB1c2Ugb3B0X2h0IG9yIG9wdF9zbXQgZG9lc24ndCBtYXR0ZXIgbXVjaAo+IHRv
IG1lKS4gSSBkb24ndCBzZWUgYW55IHNvdXJjZSBvZiBwb3NzaWJsZSBpc3N1ZXMgd2l0aCB0aGlz
LgoKVHJ5IGNvbXBpbGluZyBpdC4KCkkgdHJpZWQgZXhhY3RseSB0aGlzIHdpdGggYnRpPSBhbmQg
c3BlYy1jdHJsPSBvcmlnaW5hbGx5LsKgIFRoZSBwcm9ibGVtCmlzIHRoYXQgdGhlIHNlY29uZCBh
cmd1bWVudCBtdXN0IGJlICh0cmFuc2xhdGlvbiB1bml0KSB1bmlxdWUsIGJlY2F1c2UKb2YgdGhl
IHdheSBpdCBpcyB1c2VkIHRvIGZvcm0gdGhlIG5hbWUgb2YgdGhlIHN0cnVjdCBrZXJuZWxfcGFy
YW0uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
