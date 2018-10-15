From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 15 Oct 2018 09:28:27 -0400
Message-ID: <bbc5731a-8dcb-5daf-36f2-d6c1fabd2719@oracle.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
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

T24gMTAvMTUvMTggNjozNiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAgCj4gQEAgLTU2Nyw3
ICs1NzMsMTAgQEAgc3RydWN0IGFyY2hfdmNwdQo+ICAgICAgdm9pZCAgICAgICAgICAgICAgKmZw
dV9jdHh0Owo+ICAgICAgdW5zaWduZWQgbG9uZyAgICAgIHZnY19mbGFnczsKPiAgICAgIHN0cnVj
dCBjcHVfdXNlcl9yZWdzIHVzZXJfcmVnczsKPiAtICAgIHVuc2lnbmVkIGxvbmcgICAgICBkZWJ1
Z3JlZ1s4XTsKPiArCj4gKyAgICAvKiBEZWJ1ZyByZWdpc3RlcnMuICovCj4gKyAgICB1bnNpZ25l
ZCBsb25nIGRyWzRdLCBkcjc7Cj4gKyAgICB1bnNpZ25lZCBpbnQgZHI2OwoKV2h5IGFyZSBkcjYg
YW5kIGRyNyBkaWZmZXJlbnQgdHlwZXM/IFRoZXkgYXJlIGJvdGggTUJaIGluIHVwcGVyIGJpdHMg
aW4KNjQtYml0IG1vZGUsIGFyZW4ndCB0aGV5PwoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
