From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 2/4] x86/vvmx: Correct the INVALID_PADDR
 checks for VMPTRLD/VMCLEAR
Date: Fri, 23 Nov 2018 02:56:27 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE61A69@SHSMSX101.ccr.corp.intel.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
 <1542289970-32709-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542289970-32709-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE1LCAyMDE4IDk6NTMgUE0NCj4gDQo+IFRoZSBy
ZWZlcmVuY2VkIGFkZHJlc3NlcyBhbHNvIG5lZWQgY2hlY2tpbmcgYWdhaW5zdCBNQVhQSFlTQURE
Ui4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
