From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/entry: Correct comparisons
 against boolean variables
Date: Fri, 2 Mar 2018 17:32:03 +0000
Message-ID: <20180302173203.jdkxsaho2xbi5lsd@citrix.com>
References: <1519743036-11600-1-git-send-email-andrew.cooper3@citrix.com>
 <1519743036-11600-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519743036-11600-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDI6NTA6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgY29ycmVjdCB3YXkgdG8gY2hlY2sgYSBib29sZWFuIGlzIGBjbXBiICQwYCBv
ciBgdGVzdGIgJDB4ZmZgLCB3aGVyZWFzIGEKPiBsb3Qgb2Ygb3VyIGVudHJ5IGNvZGUgdXNlcyBg
dGVzdGIgJDFgLiAgVGhpcyB3aWxsIHdvcmsgaW4gcHJpbmNpcGxlIGZvciB2YWx1ZXMKPiB3aGlj
aCBhcmUgcmVhbGx5IEMgX0Jvb2wgdHlwZXMsIGJ1dCB3b24ndCB3b3JrIGZvciBvdGhlciBpbnRl
Z2VyIHR5cGVzIHdoaWNoCj4gYXJlIGludGVuZGVkIHRvIGhhdmUgYm9vbGVhbiBwcm9wZXJ0aWVz
Lgo+IAo+IGNtcCBpcyB0aGUgbW9yZSBsb2dpY2FsIHdheSBvZiB0aGlua2luZyBhYm91dCB0aGUg
b3BlcmF0aW9uLCBzbyBhZGp1c3QgYWxsCj4gb3V0c3RhbmRpbmcgdXNlcyBvZiBgdGVzdGIgJDFg
IGFnYWluc3QgYm9vbGVhbiB2YWx1ZXMuICBDaGFuZ2luZyB0ZXN0IHRvIGNtcAo+IGNoYW5nZXMg
dGhlIGxvZ2ljYWwgbW5lbW9uaWMgb2YgdGhlIGZvbGxvd2luZyBjb25kaXRpb24gZnJvbSAnemVy
bycgdG8KPiAnZXF1YWwnLCBidXQgdGhlIGFjdHVhbCBlbmNvZGluZyByZW1haW5zIHRoZSBzYW1l
Lgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBhcyBhbGwgdXNlcyBhcmUgcmVhbCBDIF9Cb29s
IHR5cGVzLCBhbmQgY29uZmlybWVkIGJ5Cj4gZGlmZmluZyB0aGUgZGlzYXNzZW1ibHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
