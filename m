From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Tue, 27 Nov 2018 13:45:59 +0200
Message-ID: <8ad5c4f8-b4b5-2a91-73d2-6b7c3ddece5c@bitdefender.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FTPm=OG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gRboj-0005bu-2K
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 11:46:13 +0000
In-Reply-To: <20181127113205.ohli6saatlwid7ua@mac>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjcvMTggMTozMiBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBXb3VsZCBpdCBi
ZSBwb3NzaWJsZSB0byBhZGQgc29tZSBraW5kIG9mIGZsYWcgdG8gdGhlIGVtdWxhdG9yIHRvCj4g
c2lnbmFsIHdoZXRoZXIgcDJtIHJlc3RyaWN0aW9ucyBzaG91bGQgYmUgZW5mb3JjZWQvaWdub3Jl
ZD8KPiBodm1lbXVsX2FjcXVpcmVfcGFnZSBzZWVtcyBsaWtlIGEgc3VpdGFibGUgcGxhY2UsIGJ1
dCBJJ20gbm90IHRoYXQKPiBmYW1pbGlhciB3aXRoIHRoZSBlbXVsYXRvci4KPiAKPiBUaGVuIHlv
dSBjb3VsZCBnZW5lcmF0ZSB2bSBldmVudHMgZnJvbSB0aGUgZW11bGF0b3IgaXRzZWxmLCB3aGlj
aAo+IEFGQUlDVCBpcyB0aGUgb25seSB3YXkgdG8gaGFuZGxlIHRoaXMgaW5zdHJ1Y3Rpb24gZXhl
Y3V0aW9uIGlzc3VlLgoKSSBob3BlIHNvLCB3ZSdsbCBkZWZpbml0ZWx5IGxvb2sgaW50byB0aGF0
LgoKPiBJTU8sIHRoZSBiZXN0IHdheSBpcyBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzIGlzc3VlIGlz
IHRvIGVuaGFuY2UgdGhlCj4gZW11bGF0b3IgdG8gYmUgYWJsZSB0byBnZW5lcmF0ZSB2bSBldmVu
dHMuCgpSaWdodCwgaXQgZG9lcyBsb29rIHRoYXQgd2F5IHRvIG1lIHRvby4gSG9wZWZ1bGx5IHdl
IGNhbiBnZXQgc29tZXRoaW5nCndvcmtpbmcgdGhhdCB3YXkuCgoKVGhhbmtzLApSYXp2YW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
