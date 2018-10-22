From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Consolidate the storage of
 MSR_AMD64_DR{0-3}_ADDRESS_MASK
Date: Mon, 22 Oct 2018 11:57:17 +0100
Message-ID: <c1d2445c-928f-5b67-8b17-77099eaefc15@citrix.com>
References: <1539962062-9406-1-git-send-email-andrew.cooper3@citrix.com>
 <f864baa1-c151-4437-ebf4-c0ada29b147b@oracle.com>
 <20181022105317.nlvizgox4wcmschg@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181022105317.nlvizgox4wcmschg@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTAvMTggMTE6NTMsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTksIDIwMTgg
YXQgMDY6NTI6MDJQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMC8xOS8x
OCAxMToxNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L21zci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaAo+Pj4gaW5kZXgg
N2EwNjFiMi4uYzFjYjM4ZiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNy
LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmgKPj4+IEBAIC0yODcsNiArMjg3
LDEyIEBAIHN0cnVjdCB2Y3B1X21zcnMKPj4+ICAgICAgICAgICAgICBib29sIGNwdWlkX2ZhdWx0
aW5nOjE7Cj4+PiAgICAgICAgICB9Owo+Pj4gICAgICB9IG1pc2NfZmVhdHVyZXNfZW5hYmxlczsK
Pj4+ICsKPj4+ICsgICAgLyoKPj4+ICsgICAgICogMHhjMDAxMTB7MjcsMTktMWJ9IE1TUl9BTUQ2
NF9EUnswLTN9X0FERFJFU1NfTUFTSwo+Pj4gKyAgICAgKiBUT0RPOiBOb3QgeWV0IGhhbmRsZWQg
YnkgZ3Vlc3Rfe3JkLHdyfW1zcigpIGluZnJhc3RydWN0dXJlLgo+Pj4gKyAgICAgKi8KPj4+ICsg
ICAgdWludDMyX3QgZHJfbWFza1s0XTsKPj4+ICB9Owo+Pj4gIAo+PiBZb3UgZG9uJ3QgdGhpbmsg
d3JhcHBpbmcgdGhlc2UgaW50byBhbiBpbnRlbC9hbWQgdW5pb24gd291bGQgYmUgdXNlZnVsPwo+
IFNhbWUgcXVlc3Rpb24gaGVyZS4gRFIgbWFza3Mgc2VlbSB0byBiZSBBTUQgc3BlY2lmaWMuCgpE
b2VzIHRoZSBzdm0vdnQteCBoZXJlIHBlcnRhaW4gdG8gdGhlIGhvc3QgcHJvY2Vzc29yLCBvciB0
aGUgZ3Vlc3QKY3Jvc3MtdmVuZG9yIHNldHRpbmc/wqAgKFRoYXQncyBhIHJoZXRvcmljYWwgcXVl
c3Rpb24uwqAgSXRzIGEgY29tcGxldGUKY2FuIG9mIHdvcm1zIHdoaWNoIEkgZG9uJ3Qgd2FudCB0
byBvcGVuKS4KCkZvciB0aGUgc2FrZSBvZiAxNiBieXRlcywgSSBkb24ndCB0aGluayBpdHMgd29y
dGggaXQuwqAgV2UgY2FuIGFsd2F5cwpyZXZpc2l0IHRoaXMgaW4gdGhlIGZ1dHVyZSBpZiBuZWNl
c3NhcnkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
