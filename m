From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2 13/13] x86/domctl: Implement
 XEN_DOMCTL_get_cpu_policy
Date: Fri, 17 Aug 2018 17:22:39 -0400
Message-ID: <76f8131e-709f-a868-595a-be554985774b@tycho.nsa.gov>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-14-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1531512194-6865-14-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTMvMjAxOCAwNDowMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGcm9tOiBTZXJn
ZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4gCj4gVGhpcyBmaW5hbGx5IChh
ZnRlciBsaXRlcmFsbHkgeWVhcnMgb2Ygd29yayEpIG1hcmtzIHRoZSBwb2ludCB3aGVyZSB0aGUK
PiB0b29sc3RhY2sgY2FuIGFzayB0aGUgaHlwZXJ2aXNvciBmb3IgdGhlIGN1cnJlbnQgQ1BVSUQg
Y29uZmlndXJhdGlvbiBvZiBhCj4gc3BlY2lmaWMgZG9tYWluLgo+IAo+IEFsc28gZXh0ZW5kIHhl
bi1jcHVpZCdzIC0tcG9saWN5IG1vZGUgdG8gYmUgYWJsZSB0byB0YWtlIGEgZG9taWQgYW5kIGR1
bXAgYQo+IHNwZWNpZmljIGRvbWFpbnMgQ1BVSUQgYW5kIE1TUiBwb2xpY3kuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CgpTaW5j
ZSB0aGlzIGlzIGEgcmVhZCBvcGVyYXRpb24sIGl0IHNob3VsZCBoYXZlIGEgbmV3IGFjY2VzcyB2
ZWN0b3IgKHByb2JhYmx5CmdldF9jcHVpZCkgaW5zdGVhZCBvZiBzaXR0aW5nIHVuZGVyIHNldF9j
cHVpZCBzbyB0aGF0IGl0IGlzIHBvc3NpYmxlIHRvIGFsbG93CnZpZXdpbmcgdGhlIHBvbGljeSB3
aXRob3V0IGFsbG93aW5nIGl0IHRvIGJlIGNoYW5nZWQgKHVzZWZ1bCBmb3IgbWlncmF0aW9uIG91
dCwKaW50cm9zcGVjdGlvbiwgb3IgZHVwbGljYXRpbmcgdGhlIHNldHRpbmdzIG9uIGEgbm93LXBy
b3RlY3RlZCBkb21haW4pLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
