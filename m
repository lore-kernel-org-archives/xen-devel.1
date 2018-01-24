From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/4 v3 for-4.10] libxl: Fix the bug
 introduced in commit "libxl: use correct type modifier for vuart_gfn"
Date: Wed, 24 Jan 2018 12:34:54 +0000
Message-ID: <20180124123454.eyggelo46kqwz6v2@citrix.com>
References: <1509432908-17449-1-git-send-email-bhupinder.thakur@linaro.org>
 <20171031100750.gehoh5b2m3t5qga6@citrix.com>
 <470ff461-3baa-81d0-a694-caf0ca6b6f07@linaro.org>
 <20171114100513.ex57gt3ynadh5hub@citrix.com>
 <CACtJ1JQ=7oam=qbRYEro37qJursKynuXNv58yxV_x+RmscDcKQ@mail.gmail.com>
 <20171114135611.htpdhrovmirz7vss@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeKGh-0006EX-Rm
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 12:35:07 +0000
Content-Disposition: inline
In-Reply-To: <20171114135611.htpdhrovmirz7vss@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bhupinder Thakur <bhupinder.thakur@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@linaro.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMTQsIDIwMTcgYXQgMDE6NTY6MTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIE5vdiAxNCwgMjAxNyBhdCAwNToxMjoyNlBNICswNTMwLCBCaHVwaW5kZXIgVGhh
a3VyIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIDE0IE5vdiAyMDE3IDM6MzUgcG0sICJXZWkg
TGl1IiA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gT24gTW9uLCBOb3Yg
MTMsIDIwMTcgYXQgMDM6NTY6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+
IEhpIFdlaSwKPiA+ID4gPgo+ID4gPiA+IFNvcnJ5IEkgbWlzc2VkIHRoYXQgZS1tYWlsLgo+ID4g
PiA+Cj4gPiA+ID4gT24gMTAvMzEvMjAxNyAxMDowNyBBTSwgV2VpIExpdSB3cm90ZToKPiA+ID4g
PiA+IENoYW5nZSB0aGUgdGFnIHRvIGZvci00LjEwLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEp1bGll
biwgdGhpcyBpcyBuZWVkZWQgdG8gZml4IHZ1YXJ0IGVtdWxhdGlvbi4KPiA+ID4gPgo+ID4gPiA+
IFRvIGNvbmZpcm0sIG9ubHkgcGF0Y2ggIzEgaXMgY2FuZGlkYXRlIGZvciBYZW4gNC4xMCwgcmln
aHQ/IFRoZSByZXN0Cj4gPiA+IHdpbGwgYmUKPiA+ID4gPiBxdWV1ZWQgZm9yIFhlbiA0LjExPwo+
ID4gPiA+Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgc28uCj4gPiA+Cj4gPiA+IEJodXBpbmRlciwgY2Fu
IHlvdSBjb25maXJtIHRoYXQ/Cj4gPiA+Cj4gPiAKPiA+IFllcy4gT25seSBmaXJzdCBwYXRjaCBp
cyByZXF1aXJlZCBmb3IgZml4aW5nIHRoZSBjb21waWxhdGlvbiBpc3N1ZS4KPiA+IAo+IAo+IFRo
YW5rcy4gSSB3aWxsIGNvbW1pdCB0aGUgZmlyc3QgcGF0Y2ggYW5kIHB1dCB0aGUgcmVzdCBpbiBt
eSBmb3ItbmV4dAo+IHF1ZXVlLgoKT0ssIHBhdGNoIDIgdG8gNCBhcHBsaWVkIGNsZWFubHkgYnV0
IHRoZSBidWlsZCBpcyBicm9rZW4gYnkgdGhlbS4KCmxpYnhsX2NvbnNvbGUuYzogSW4gZnVuY3Rp
b24g4oCYbGlieGxfX2RldmljZV9jb25zb2xlX2FkZOKAmToKbGlieGxfY29uc29sZS5jOjMzMjo2
ODogZXJyb3I6IOKAmGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUge2FrYSBzdHJ1Y3QgPGFub255
bW91cz594oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYY29uc29sZV9tZm7igJk7IGRpZCB5b3Ug
bWVhbiDigJhjb25zb2xlX2dmbuKAmT8KICAgICAgICAgZmxleGFycmF5X2FwcGVuZChyb19mcm9u
dCwgR0NTUFJJTlRGKCIlIlBSSXVfeGVuX3Bmbiwgc3RhdGUtPmNvbnNvbGVfbWZuKSk7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgpsaWJ4bF9pbnRlcm5hbC5oOjM5MjE6NTg6IG5vdGU6IGluIGRlZmluaXRpb24gb2Yg
bWFjcm8g4oCYR0NTUFJJTlRG4oCZCiAjZGVmaW5lIEdDU1BSSU5URihmbXQsIC4uLikgKGxpYnhs
X19zcHJpbnRmKChnYyksIChmbXQpLCBfX1ZBX0FSR1NfXykpCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fgoKRm9yIG5v
dyBJJ3ZlIGRyb3BwZWQgdGhpcyBzZXJpZXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
