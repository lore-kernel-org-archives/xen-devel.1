From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/hvm: Drop hvm_{vmx,svm} shorthands
Date: Thu, 30 Aug 2018 17:08:06 +0100
Message-ID: <0fbd5ada-5795-75e9-de33-d206ad6a97da@citrix.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912E11F1@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912E11F1@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMDI6MzksIFRpYW4sIEtldmluIHdyb3RlOgo+PiBGcm9tOiBBbmRyZXcgQ29v
cGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0KPj4gU2VudDogV2VkbmVzZGF5
LCBBdWd1c3QgMjksIDIwMTggMTozOSBBTQo+Pgo+PiBCeSBtYWtpbmcge3ZteCxzdm19IGluIGh2
bV92Y3B1IGludG8gYW4gYW5vbnltb3VzIHVuaW9uIChjb25zaXN0ZW50Cj4+IHdpdGgKPj4gZG9t
YWluIHNpZGUgb2YgdGhpbmdzKSwgdGhlIGh2bV97dm14LHN2bX0gZGVmaW5lcyBjYW4gYmUgZHJv
cHBlZCwgYW5kIGFsbAo+PiBjb2RlCj4+IHJlZmVyIHRvIHRoZSBjb3JyZWN0bHktbmFtZWQgZmll
bGRzLiAgVGhpcyBtZWFucyB0aGF0IHRoZSBkYXRhIGhpZXJhY2h5IGlzIG5vCj4+IGxvbmdlciBv
YnNjdXJlZCBmcm9tIGdyZXAvY3Njb3BlL3RhZ3MvZXRjLgo+Pgo+PiBSZWZvcm1hdCBvbmUgY29t
bWVudCBhbmQgc3dpdGNoIG9uZSBib29sX3QgdG8gYm9vbCB3aGlsZSBtYWtpbmcKPj4gY2hhbmdl
cy4KPj4KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+Cj4gb25lIHNtYWxsIG5vdGUuIEluIGNvdmVy
bGV0dGVyOgo+Cj4gCSIgVGhpcyBzZXJpZXMgc3RhcnRlZCBieSB0cnlpbmcgdG8gYWRkcmVzcyB0
aGUgYnVnIGluIHBhdGNoIDcsIAo+IGFuZCBiYWxsb29uZWQgc29tZXdoYXQuIgo+Cj4gdGhlcmUg
aXMgbm8gYnVnIHBlciBzZSBpbiB0aGlzIHBhdGNoLCByaWdodD8KCkkgc2hvdWxkIHByb2JhYmx5
IGhhdmUgc2FpZCBpc3N1ZSByYXRoZXIgdGhhbiBidWcuwqAgSSB3YXMgcmVmZXJyaW5nIHRvCnRo
ZSBvYnNjdXJpbmcgb2YgZGF0YSBmcm9tIGdyZXAvY3Njb3BlL3RhZ3MvZXRjLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
