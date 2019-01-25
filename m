From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] x86/p2m: Drop erroneous
 #VE-enabled check in ept_set_entry()
Date: Fri, 25 Jan 2019 06:50:15 +0100
Message-ID: <9b873ac9-f1da-5444-da73-42b723d37439@suse.com>
References: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxOToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDb2RlIGNsZWFyaW5n
IHRoZSAiU3VwcHJlc3MgVkUiIGJpdCBpbiBhbiBFUFQgZW50cnkgaXNuJ3QgbmVjZWNzc2VyaWx5
IHJ1bm5pbmcKPiBpbiBjdXJyZW50IGNvbnRleHQuICBJbiBBTFRQMk1fZXh0ZXJuYWwgbW9kZSwg
aXQgZGVmaW5pdGVseSBpcyBub3QsIGFuZCBpbiBQVgo+IGNvbnRleHQsIHZjcHVfYWx0cDJtKGN1
cnJlbnQpIGFjdHMgdXBvbiB0aGUgSFZNIHVuaW9uLgo+IAo+IEV2ZW4gaWYgd2UgY291bGQgc2Vu
c2libHkgcmVzb2x2ZSB0aGUgdGFyZ2V0IHZDUFUsIGl0IG1heSBsZWdpdGltYXRlbHkgbm90IGJl
Cj4gZnVsbHkgc2V0IHVwIGF0IHRoaXMgcG9pbnQsIHNvIHJlamVjdGluZyB0aGUgRVBUIG1vZGlm
aWNhdGlvbiB3b3VsZCBiZSBidWdneS4KPiAKPiBUaGVyZSBpcyBhIHBhdGggaW4gaHZtX2hhcF9u
ZXN0ZWRfcGFnZV9mYXVsdCgpIHdoaWNoIGV4cGxpY2l0bHkgZW11bGF0ZXMgI1ZFCj4gaW4gdGhl
IGNwdV9oYXNfdm14X3ZpcnRfZXhjZXB0aW9ucyBjYXNlLCBzbyB0aGUgLUVPUE5PVFNVUFAgcGFy
dCBvZiB0aGlzCj4gY29uZGl0aW9uIGlzIGFsc28gd3JvbmcuCj4gCj4gRHJvcCB0aGUgIXN2ZSBj
aGVjayBlbnRpcmVseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
