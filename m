From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 15 Oct 2018 14:32:18 +0100
Message-ID: <f35e722a-7680-9cde-26b3-b8f669253e2f@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
 <bbc5731a-8dcb-5daf-36f2-d6c1fabd2719@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bbc5731a-8dcb-5daf-36f2-d6c1fabd2719@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMTggMTQ6MjgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMC8xNS8xOCA2
OjM2IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiAgCj4+IEBAIC01NjcsNyArNTczLDEwIEBA
IHN0cnVjdCBhcmNoX3ZjcHUKPj4gICAgICB2b2lkICAgICAgICAgICAgICAqZnB1X2N0eHQ7Cj4+
ICAgICAgdW5zaWduZWQgbG9uZyAgICAgIHZnY19mbGFnczsKPj4gICAgICBzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyB1c2VyX3JlZ3M7Cj4+IC0gICAgdW5zaWduZWQgbG9uZyAgICAgIGRlYnVncmVnWzhd
Owo+PiArCj4+ICsgICAgLyogRGVidWcgcmVnaXN0ZXJzLiAqLwo+PiArICAgIHVuc2lnbmVkIGxv
bmcgZHJbNF0sIGRyNzsKPj4gKyAgICB1bnNpZ25lZCBpbnQgZHI2Owo+IFdoeSBhcmUgZHI2IGFu
ZCBkcjcgZGlmZmVyZW50IHR5cGVzPyBUaGV5IGFyZSBib3RoIE1CWiBpbiB1cHBlciBiaXRzIGlu
Cj4gNjQtYml0IG1vZGUsIGFyZW4ndCB0aGV5PwoKQ29ycmVjdC7CoCBUaGV5IHNob3VsZCBib3Ro
IGJlIDMyIGJpdHMgd2lkZSwgYnV0IF9fdm1yZWFkKCkgbmVlZHMgdG8gdGFrZQpkcjcgYnkgdW5z
aWduZWQgbG9uZyAqCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
