From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH 1/2] x86/svm: Improve diagnostics when
 __get_instruction_length_from_list() fails
Date: Fri, 30 Nov 2018 17:13:37 +0000
Message-ID: <20181130171333.GB5122@amd.com>
References: <1543597640-28870-1-git-send-email-andrew.cooper3@citrix.com>
 <1543597640-28870-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1543597640-28870-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <8964E98C2EC3EC49B4951FA08AB26238@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDU6MDc6MTlQTSArMDAwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gU2FkbHksIGEgbG9uZToKPiAKPiAgIChYRU4pIGVtdWxhdGUuYzoxNTY6ZDJ2MCBfX2dl
dF9pbnN0cnVjdGlvbl9sZW5ndGhfZnJvbV9saXN0OiBNaXNtYXRjaCBiZXR3ZWVuIGV4cGVjdGVk
IGFuZCBhY3R1YWwgaW5zdHJ1Y3Rpb246IGVpcCA9IGZmZmZmODA0NTY0MTM5YzAKPiAKPiBvbiB0
aGUgY29uc29sZSBpcyBvZiBubyB1c2UgdHJ5aW5nIHRvIGlkZW50aWZ5IHdoYXQgd2VudCB3cm9u
Zy4gIER1bXAgYXMgbXVjaAo+IHN0YXRlIGFzIHdlIGNhbiB0byBoZWxwIGlkZW50aWZ5IHdoYXQg
d2VudCB3cm9uZy4KPiAKPiBSZXBvcnRlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29t
PgoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
