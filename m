From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 15 Oct 2018 09:52:59 -0400
Message-ID: <f85e7f8f-ec31-d47c-20b7-46b2f7fdbd2c@oracle.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
 <bbc5731a-8dcb-5daf-36f2-d6c1fabd2719@oracle.com>
 <f35e722a-7680-9cde-26b3-b8f669253e2f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f35e722a-7680-9cde-26b3-b8f669253e2f@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTUvMTggOTozMiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8xMC8xOCAx
NDoyOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMC8xNS8xOCA2OjM2IEFNLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4gIAo+Pj4gQEAgLTU2Nyw3ICs1NzMsMTAgQEAgc3RydWN0IGFy
Y2hfdmNwdQo+Pj4gICAgICB2b2lkICAgICAgICAgICAgICAqZnB1X2N0eHQ7Cj4+PiAgICAgIHVu
c2lnbmVkIGxvbmcgICAgICB2Z2NfZmxhZ3M7Cj4+PiAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdz
IHVzZXJfcmVnczsKPj4+IC0gICAgdW5zaWduZWQgbG9uZyAgICAgIGRlYnVncmVnWzhdOwo+Pj4g
Kwo+Pj4gKyAgICAvKiBEZWJ1ZyByZWdpc3RlcnMuICovCj4+PiArICAgIHVuc2lnbmVkIGxvbmcg
ZHJbNF0sIGRyNzsKPj4+ICsgICAgdW5zaWduZWQgaW50IGRyNjsKPj4gV2h5IGFyZSBkcjYgYW5k
IGRyNyBkaWZmZXJlbnQgdHlwZXM/IFRoZXkgYXJlIGJvdGggTUJaIGluIHVwcGVyIGJpdHMgaW4K
Pj4gNjQtYml0IG1vZGUsIGFyZW4ndCB0aGV5Pwo+IENvcnJlY3QuwqAgVGhleSBzaG91bGQgYm90
aCBiZSAzMiBiaXRzIHdpZGUsIGJ1dCBfX3ZtcmVhZCgpIG5lZWRzIHRvIHRha2UKPiBkcjcgYnkg
dW5zaWduZWQgbG9uZyAqCj4KCgpBaCwgT0ssIHRoYW5rcy4KClJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
