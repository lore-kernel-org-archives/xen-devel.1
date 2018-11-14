From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 6/8] x86/vvmx: refactor
 nvmx_handle_vmclear()
Date: Wed, 14 Nov 2018 03:15:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49B90@SHSMSX101.ccr.corp.intel.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
 <20181106120759.8789-7-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-7-sergey.dyasli@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBTZXJnZXkgRHlhc2xpIFttYWlsdG86c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tXQo+
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDYsIDIwMTggODowOCBQTQo+IAo+IDEuIEFkZCBWTVhf
SU5TTl9WTUNMRUFSX1dJVEhfVk1YT05fUFRSIGVycm5vIGFuZCBhZGQgdGhlCj4gYXBwcm9wcmlh
dGUKPiAgICBjaGVjayB0byB0aGUgZnVuY3Rpb24uCj4gCj4gMi4gQ29ycmVjdCB0aGUgcmV0dXJu
IHZhbHVlIGZvciBub3QtNEtCLWFsaWduZWQgY2FzZSBhbmQgZm9yIGludmFsaWQKPiAgICBwaHlz
YWRkciAod2hlbiBodm1fbWFwX2d1ZXN0X2ZyYW1lX3J3KCkgZmFpbHMpLgo+IAo+IDMuIFJlbW92
ZSBlbnVtIHZteF9vcHNfcmVzdWx0IGFuZCB1c2Ugdm1mYWlsL3Ztc3VjY2VlZCgpIGNhbGxzIGRp
cmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
