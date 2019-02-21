From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH tentitively for-4.12 0/4] x86/altp2m: Fix
 multiple security issues
Date: Thu, 21 Feb 2019 14:13:12 +0100
Message-ID: <019f63bd-a493-4557-f97d-2f50c2301130@suse.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMjAxOSAyMzoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVyZSBhcmUgbm8g
WFNBcyBiZWNhdXNlIGFsdHAybSBpc24ndCBzZWN1cml0eSBzdXBwb3J0ZWQuICBIb3dldmVyLCBp
dCB3b3VsZAo+IGJlIHZlcnkgbmljZSB0byBoYXZlIGl0IGluIGEgbGVzcyBicm9rZW4gc3RhdGUg
Zm9yIDQuMTIuCj4gCj4gT3ZlcmFsbCB0aGUgcmlzayBvZiByZWdyZXNzaW9uIHRvIG90aGVyIHBh
cnRzIG9mIFhlbiBpcyBtaW5pbWFsLCBhcyBtb3N0IG9mCj4gdGhlc2UgY2hhbmdlcyBhcmUgb25s
eSBpbiBhbHRwMm0tZW5hYmxlZCBwYXRocy4KPiAKPiBBbmRyZXcgQ29vcGVyICg0KToKPiAgIHhl
bi9jb21tb246IEJyZWFrIGRvbWFpbl91bm1hcF9yZXNvdXJjZXMoKSBvdXQgb2YgZG9tYWluX2tp
bGwoKQo+ICAgeDg2L2FsdHAybTogUmV3b3JrICNWRSBlbmFibGUvZGlzYWJsZSBwYXRocwo+ICAg
eDg2L3ZteDogRml4IHNlY3VyaXR5IGlzc3VlIHdoZW4gYSBndWVzdCBiYWxsb29ucyBvdXQgdGhl
ICNWRSBpbmZvIHBhZ2UKPiAgIHg4Ni92bXg6IFByb3Blcmx5IGZsdXNoIHRoZSBUTEIgd2hlbiBh
biBhbHRwMm0gaXMgbW9kaWZpZWQKPiAKPiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAg
IHwgIDcgKysrKwo+ICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgfCAxOSArKy0tLS0t
LS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDY5ICsrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvbW0vYWx0cDJtLmMgICAgICAg
fCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgeGVuL2Nv
bW1vbi9kb21haW4uYyAgICAgICAgICAgIHwgMTYgKysrKysrKy0tCj4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvYWx0cDJtLmggICB8ICA0ICsrLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5o
ICAgfCAgMyArKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmggfCAgNyArKystCj4g
IHhlbi9pbmNsdWRlL3hlbi9kb21haW4uaCAgICAgICB8ICA0ICsrKwo+ICA5IGZpbGVzIGNoYW5n
ZWQsIDE1MyBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiAKCkZvciB0aGUgc2VyaWVz
OgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
