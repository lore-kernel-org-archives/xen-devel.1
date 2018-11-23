From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't call vmsucceed() at the
 end of virtual_vmexit()
Date: Fri, 23 Nov 2018 02:58:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE61A9B@SHSMSX101.ccr.corp.intel.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
 <1542289970-32709-5-git-send-email-andrew.cooper3@citrix.com>
 <1210c5d3-2a61-1d66-4bf6-4e7e400829ec@citrix.com>
 <ae3a9a54-7cb7-25fe-a12d-5f32fa4b267a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ae3a9a54-7cb7-25fe-a12d-5f32fa4b267a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE1LCAyMDE4IDExOjMxIFBNDQo+IA0KPiBPbiAx
NS8xMS8yMDE4IDE1OjI4LCBTZXJnZXkgRHlhc2xpIHdyb3RlOg0KPiA+IE9uIDE1LzExLzIwMTgg
MTM6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+IFRoaXMgZW5kcyB1cCBjb3JydXB0aW5n
IEwxJ3MgdmlldyBvZiBSRkxBR1MgYnkgc2V0dGluZyBaRi4gIFRoZSBjb3JyZWN0DQo+IHZhbHVl
DQo+ID4+IGlzIGVzdGFibGlzaGVkIGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uLg0KPiA+IHZtc3Vj
Y2VlZCgpIGRvZXNuJ3Qgc2V0IGFueSBmbGFncywgb25seSBjbGVhcnMgc29tZS4gQW5kIGluIHRo
aXMgZnVuY3Rpb24NCj4gaXQncw0KPiA+IGp1c3QgcmVkdW5kYW50LiBaRiBpcyBzZXQgYnkgVk1m
YWlsVmFsaWQuIFNvIEkgdGhpbmsgdGhlIGRlc2NyaXB0aW9uIG11c3QgYmUNCj4gPiBjaGFuZ2Vk
Lg0KPiANCj4gT2ggLSBzbyBpdCBkb2VzLsKgIFllcyAtIEkgd2FzIGNvbmZ1c2luZyBpdCB3aXRo
IHRoZSBmYWlsdmFsaWQgY2FzZS4NCj4gSSdsbCBmaXggdGhlIHdvcmRpbmcgdG8gIlRoZSBjb3Jy
ZWN0IFJGTEFHUyB2YWx1ZSBpcyBlc3RhYmxpc2hlZCBlYXJsaWVyDQo+IGluIHRoZSBmdW5jdGlv
biwgYW5kIHRoaXMgY2FsbCBoYXMgbm8gbmV0IGVmZmVjdC4iDQo+IA0KDQp3aXRoIHdvcmRpbmcg
Zml4ZWQsIEFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
