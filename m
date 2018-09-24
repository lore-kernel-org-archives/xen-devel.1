From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 2/6] test/depriv: Add a tool to check
 process-level depriv
Date: Mon, 24 Sep 2018 12:14:04 +0100
Message-ID: <20180924111404.GD2244@perard.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=huth=mg=citrix.com=prvs=798618c21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1g4Ooa-0006eX-79
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 11:14:08 +0000
Content-Disposition: inline
In-Reply-To: <20180921170428.13771-2-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDY6MDQ6MjRQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvZGVwcml2L2RlcHJpdi1wcm9jZXNzLWNo
ZWNrZXIuc2ggYi90b29scy90ZXN0cy9kZXByaXYvZGVwcml2LXByb2Nlc3MtY2hlY2tlci5zaAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy90ZXN0cy9kZXByaXYvZGVwcml2LXByb2Nlc3Mt
Y2hlY2tlci5zaApbLi4uXQo+ICsjIEV4YW1wbGUgaW5wdXQ6Cj4gKyMgVWlkOgkxMTkzCTExOTMJ
MTE5MwkxMTkzCj4gK2lucHV0PSQoZ3JlcCBVaWQgL3Byb2MvJGRtcGlkL3N0YXR1cykKPiAraWYg
W1sgIiRpbnB1dCIgPX4gXlVpZDpbWzpzcGFjZTpdXSooWzAtOV0rKVtbOnNwYWNlOl1dKihbMC05
XSspW1s6c3BhY2U6XV0qKFswLTldKylbWzpzcGFjZTpdXSooWzAtOV0rKSQgXV0gOyB0aGVuCgpZ
b3Ugc2hvdWxkIHJlcGxhY2UgYWxsIHRoZSAqIGJ5ICsuIFN1cmVseSB5b3Ugd2FudCBhdCBsZWFz
dCBvbmUgc3BhY2UKYmV0d2VlbiB0d28gbnVtYmVycy4KCj4gKyAgICByZXN1bHQ9IlBBU1NFRCIK
PiArICAgIGZvciBpIGluIHsxLi40fTsgZG8KPiArCWlmIFtbICIke0JBU0hfUkVNQVRDSFskaV19
IiAhPSAiJHRndF91aWQiIF1dIDsgdGhlbgo+ICsJICAgIHJlc3VsdD0iRkFJTEVEIgo+ICsJICAg
IGZhaWxlZD0idHJ1ZSIKPiArCSAgICBicmVhawo+ICsJZmkKPiArICAgIGRvbmUKPiArZWxzZQo+
ICsgICAgcmVzdWx0PSJGQUlMRUQiCj4gKyAgICBmYWlsZWQ9InRydWUiCj4gK2ZpCj4gK2VjaG8g
JHJlc3VsdAo+ICsKPiArIyBFeGFtcGxlIGlucHV0Ogo+ICsjIEdpZDoJMTAwMjAJMTAwMjAJMTAw
MjAJMTAwMjAKPiArZWNobyAtbiAiUHJvY2VzcyBHSUQ6ICIKPiAraW5wdXQ9JChncmVwIFVpZCAv
cHJvYy8kZG1waWQvc3RhdHVzKQoKSGVyZSBncmVwIGZvciAiVWlkIiBidXQgLi4uCgo+ICtpZiBb
WyAiJGlucHV0IiA9fiBeR2lkOltbOnNwYWNlOl1dKihbMC05XSspW1s6c3BhY2U6XV0qKFswLTld
KylbWzpzcGFjZTpdXSooWzAtOV0rKVtbOnNwYWNlOl1dKihbMC05XSspJCBdXSA7IHRoZW4KCmhl
cmUgaXMgIkdpZCIuCgo+ICsgICAgcmVzdWx0PSJQQVNTRUQiCj4gKyAgICBmb3IgaSBpbiB7MS4u
NH07IGRvCj4gKwlpZiBbWyAiJHtCQVNIX1JFTUFUQ0hbJGldfSIgIT0gIiQ2NTUzNCIgXV0gOyB0
aGVuCgpJcyAiJDY1NTM0IiBzdXBwb3NlZCB0byBiZSBhIHZhcmlhYmxlPyBPciBpcyAiJCIgYSBl
eHRyYSBjaGFyYWN0ZXI/CgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
