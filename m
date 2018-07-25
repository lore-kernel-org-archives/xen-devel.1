From: Juergen Gross <jgross@suse.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Wed, 25 Jul 2018 18:29:25 +0200
Message-ID: <3b825085-6fb2-6204-4eff-eaad8059f1d2@suse.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
 <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
 <20180725161210.qm3kmcw6ylfbycfk@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sdpf=kj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fiMfK-0001vt-Oi
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 16:29:30 +0000
In-Reply-To: <20180725161210.qm3kmcw6ylfbycfk@mac.bytemobile.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, bercarug@amazon.com
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDcvMTggMTg6MTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MjUsIDIwMTggYXQgMDU6MDU6MzVQTSArMDMwMCwgYmVyY2FydWdAYW1hem9uLmNvbSB3cm90ZToK
Pj4gT24gMDcvMjUvMjAxOCAwNTowMiBQTSwgV2VpIExpdSB3cm90ZToKPj4+IE9uIFdlZCwgSnVs
IDI1LCAyMDE4IGF0IDAzOjQxOjExUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4g
T24gMjUvMDcvMTggMTU6MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+PiBXaGF0IGNv
dWxkIGJlIGNhdXNpbmcgdGhlIGF2YWlsYWJsZSBtZW1vcnkgbG9zcyBwcm9ibGVtPwo+Pj4+PiBU
aGF0IHNlZW1zIHRvIGJlIExpbnV4IGFnZ3Jlc3NpdmVseSBiYWxsb29uaW5nIG91dCBtZW1vcnks
IHlvdSBnbyBmcm9tCj4+Pj4+IDcxMjlNIHRvdGFsIG1lbW9yeSB0byAyNDZNLiBBcmUgeW91IGNy
ZWF0aW5nIGEgbG90IG9mIGRvbWFpbnM/Cj4+Pj4gVGhpcyBtaWdodCBiZSByZWxhdGVkIHRvIHRo
ZSB0b29scyB0aGlua2luZyBkb20wIGlzIGEgUFYgZG9tYWluLgo+Pj4gR29vZCBwb2ludC4KPj4+
Cj4+PiBJbiB0aGF0IGNhc2UsIHhlbnN0b3JlLWxzIC1mcCB3b3VsZCBhbHNvIGJlIHVzZWZ1bC4g
VGhlIG91dHB1dCBzaG91bGQKPj4+IHNob3cgdGhlIGJhbGxvb24gdGFyZ2V0IGZvciBEb20wLgo+
Pj4KPj4+IFlvdSBjYW4gYWxzbyB0cnkgdG8gc2V0IHRoZSBhdXRvYmFsbG9vbiB0byBvZmYgaW4g
L2V0Yy94ZW4veGwuY2ZnIHRvIHNlZQo+Pj4gaWYgaXQgbWFrZXMgYW55IGRpZmZlcmVuY2UuCj4+
Pgo+Pj4gV2VpLgo+PiBBbHNvIHRyaWVkIHNldHRpbmcgYXV0b2JhbGxvb25pbmcgb2ZmLCBidXQg
aXQgaGFkIG5vIGVmZmVjdC4KPiAKPiBUaGlzIGlzIGEgTGludXgvbGlieGwgaXNzdWUgdGhhdCBJ
J20gbm90IHN1cmUgd2hhdCdzIHRoZSBiZXN0IHdheSB0bwo+IHNvbHZlLiBMaW51eCBoYXMgdGhl
IGZvbGxvd2luZyAnd29ya2Fyb3VuZCcgaW4gdGhlIGJhbGxvb24gZHJpdmVyOgo+IAo+IGVyciA9
IHhlbmJ1c19zY2FuZihYQlRfTklMLCAibWVtb3J5IiwgInN0YXRpYy1tYXgiLCAiJWxsdSIsCj4g
CQkgICAmc3RhdGljX21heCk7Cj4gaWYgKGVyciAhPSAxKQo+IAlzdGF0aWNfbWF4ID0gbmV3X3Rh
cmdldDsKPiBlbHNlCj4gCXN0YXRpY19tYXggPj49IFBBR0VfU0hJRlQgLSAxMDsKPiB0YXJnZXRf
ZGlmZiA9IHhlbl9wdl9kb21haW4oKSA/IDAKPiAJCTogc3RhdGljX21heCAtIGJhbGxvb25fc3Rh
dHMudGFyZ2V0X3BhZ2VzOwoKSG1tLCBzaG91bGRuJ3QgUFZIIGJlaGF2ZSB0aGUgc2FtZSB3YXkg
YXMgUFYgaGVyZT8gSSBkb24ndCB0aGluawp0aGVyZSBpcyBtZW1vcnkgbWlzc2luZyBmb3IgUFZI
LCBvcHBvc2VkIHRvIEhWTSdzIGZpcm13YXJlIG1lbW9yeS4KCkFkZGluZyBCb3JpcyBmb3IgYSBz
ZWNvbmQgb3Bpbmlvbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
