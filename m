From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/domctl: Implement
 XEN_DOMCTL_get_cpu_policy
Date: Mon, 5 Nov 2018 19:58:49 +0000
Message-ID: <8055d11d-15cf-cb1a-e1e5-7296115314f5@citrix.com>
References: <1541416600-30056-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416600-30056-6-git-send-email-andrew.cooper3@citrix.com>
 <20181105175208.2653ixmmqsg2smgm@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181105175208.2653ixmmqsg2smgm@mac.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTEvMTggMTc6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MDUsIDIwMTggYXQgMTE6MTY6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMgYi90b29scy9taXNjL3hlbi1jcHVpZC5j
Cj4+IGluZGV4IDk1ZWQ4NTMuLjJjNDEwMzEgMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL21pc2MveGVu
LWNwdWlkLmMKPj4gKysrIGIvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYwo+PiBAQCAtMyw2ICszLDgg
QEAKPj4gICNpbmNsdWRlIDxlcnIuaD4KPj4gICNpbmNsdWRlIDxnZXRvcHQuaD4KPj4gICNpbmNs
dWRlIDxzdHJpbmcuaD4KPj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+PiArI2luY2x1ZGUgPGxpbWl0
cy5oPgo+PiAgCj4+ICAjaW5jbHVkZSA8eGVuY3RybC5oPgo+PiAgCj4+IEBAIC0zMDksMTEgKzMx
MSwxMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4+ICB7Cj4+ICAgICAgZW51
bSB7IE1PREVfVU5LTk9XTiwgTU9ERV9JTkZPLCBNT0RFX0RFVEFJTCwgTU9ERV9JTlRFUlBSRVQs
IE1PREVfUE9MSUNZIH0KPj4gICAgICBtb2RlID0gTU9ERV9VTktOT1dOOwo+PiArICAgIGludCBk
b21pZCA9IC0xOwo+IFdvdWxkIGl0IGJlIGJldHRlciB0byB1c2UgRE9NSURfSU5WQUxJRCBpbnN0
ZWFkIG9mIC0xPwoKVGhhdCBkb2Vzbid0IGV4aXN0IGFueXdoZXJlIGNvbnNpc3RlbnQgb3IgdXNl
ZnVsIHRvIHVzZSBpbiB0aGlzIGNhc2UuwqAKKEFsc28sIGNvbmZ1c2luZ2x5LCBET01JRF9JTlZB
TElEIGlzIDB4N2ZmNCBpbiB0aGUgcHVibGljIEFCSSwgd2hpY2ggaXMKZGlmZmVyZW50IHRvIHRo
ZSBJTlZBTElEX0RPTUlEIG9mIH4wLy0xIHVzZWQgYnkgdmFyaW91cyBiaXRzIG9mIGxpYnhjCmFu
ZCBsaWJ4bCkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
