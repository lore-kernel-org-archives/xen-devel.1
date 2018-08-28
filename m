From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 15/23] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Tue, 28 Aug 2018 04:53:25 -0600
Message-ID: <5B8529A502000078001E2893@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
 <20180827090311.lfffjx2xbknpud5e@citrix.com>
 <20180828104107.4mrzq5vn2v6kujyh@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fubco-0002ab-RZ
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 10:53:30 +0000
In-Reply-To: <20180828104107.4mrzq5vn2v6kujyh@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDEyOjQxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMTA6MDM6MTFBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
Pj4gPiArI2lmZGVmIENPTkZJR19IVk0KPj4gPiAgI2RlZmluZSBoYXBfZW5hYmxlZChkKSAgKChk
KS0+YXJjaC5odm1fZG9tYWluLmhhcF9lbmFibGVkKQo+PiA+ICsjZWxzZQo+PiA+ICsjZGVmaW5l
IGhhcF9lbmFibGVkKGQpICBmYWxzZQo+PiA+ICsjZW5kaWYKPj4gCj4+IEhtbS4uLiBJIHRob3Vn
aHQgSSBoYWQgcmV3cml0dGVuIHRoaXMgdG8gYmUgYSBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uLgo+
PiAKPj4gSSB3aWxsIHRyeSB0byBtYWtlIGl0IGEgc3RhdGljIGlubGluZSBmdW5jdGlvbi4KPj4g
Cj4gCj4gSXQgYWxsIGNhbWUgYmFjazogVGhlIHJlYXNvbiBJIGRpZG4ndCB0dXJuIGl0IGludG8g
YSBzdGF0aWMgaW5saW5lCj4gZnVuY3Rpb24gd2FzIGJlY2F1c2UgYXNtL2h2bS9kb21haW4uaCBk
aWRuJ3QgaGF2ZSBzdHJ1Y3QgZG9tYWluCj4gYXZhaWxhYmxlLiBUbyBmaXggdGhhdCBpdCB3b3Vs
ZCBzZWVtIHRvIHJlcXVpcmUgbW9yZSBjb2RlIGNodXJuIHRvIG1lLgo+IAo+IEkgd2lsbCBrZWVw
IGhhcF9lbmFibGVkIGEgbWFjcm8uCgpCdXQgdGhlbiBwbGVhc2UgYXQgbGVhc3QgZXZhbHVhdGUg
aXRzIGFyZ3VtZW50LCB0byBhdm9pZCBhbnkKbmVlZCB0byBhZGQgX19tYXliZV91bnVzZWQgdG8g
bG9jYWwgdmFyaWFibGVzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
