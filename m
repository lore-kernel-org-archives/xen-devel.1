From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/svm: Improve code generation from
 cpu_has_svm_feature()
Date: Fri, 15 Mar 2019 11:59:39 -0400
Message-ID: <835b8a7f-104d-2c9e-f0e5-719477dd04c6@oracle.com>
References: <1552663389-665-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1552663389-665-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xNS8xOSAxMToyMyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUYWtpbmcgc3ZtX2Zl
YXR1cmVfZmxhZ3MgYnkgcG9pbnRlciBhbmQgdXNpbmcgdGVzdF9iaXQoKSByZXN1bHRzIGluIGdl
bmVyYXRlZAo+IGNvZGUgd2hpY2ggbG9hZHMgc3ZtX2ZlYXR1cmVfZmxhZ3MgaW50byBhIDMyYml0
IHJlZ2lzdGVyLCB0aGVuIGRvZXMgYSBiaXR3aXNlCj4gb3BlcmF0aW9uLgo+Cj4gVGhlIGxvZ2lj
IGNhbiBiZSBleHByZXNzZWQgaW4gdGVybXMgb2YgYSBzdHJhaWdodCBiaXR3aXNlIG9wZXJhdGlv
biwgcmVzdWx0aW5nCj4gaW4gdGhlIGZvbGxvd2luZyBtaW5vciBpbXByb3ZlbWVudC4KPgo+ICAg
YWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzQgdXAvZG93bjogMC8tMTM2ICgtMTM2KQo+
ICAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBu
ZXcgICBkZWx0YQo+ICAgc3ZtX25lc3RlZF9mZWF0dXJlc19vbl9lZmVyX3VwZGF0ZSAgICAgICAg
ICAgMjgxICAgICAyNzMgICAgICAtOAo+ICAgc3ZtX2NyZWF0ZV92bWNiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAxNDA0ICAgIDEzODggICAgIC0xNgo+ICAgc3ZtX3ZtZXhpdF9oYW5kbGVy
ICAgICAgICAgICAgICAgICAgICAgICAgICA2MjcxICAgIDYyMzkgICAgIC0zMgo+ICAgc3RhcnRf
c3ZtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgODE4ICAgICA3MzggICAgIC04
MAo+ICAgVG90YWw6IEJlZm9yZT0zMzQ3NTY5LCBBZnRlcj0zMzQ3NDMzLCBjaGcgLTAuMDAlCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNlbC5j
b20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
