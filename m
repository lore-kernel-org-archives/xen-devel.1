From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 13/17] x86/boot: Calculate the most
 appropriate BTI mitigation to use
Date: Tue, 16 Jan 2018 09:10:52 -0500
Message-ID: <9b0f7bd2-ff44-43ec-5f5d-9eff1cd7a32c@oracle.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-14-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515780067-31735-14-git-send-email-andrew.cooper3@citrix.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTIvMjAxOCAwMTowMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAgCj4gKyAgICBp
ZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlJTQikgKQo+ICsgICAgewo+ICsgICAgICAg
IC8qCj4gKyAgICAgICAgICogRXZlbiBpZiB3ZSd2ZSBjaG9zZW4gdG8gbm90IGhhdmUgSUJSUyBz
ZXQgaW4gWGVuIGNvbnRleHQsIHdlIHN0aWxsCj4gKyAgICAgICAgICogbmVlZCB0aGUgSUJSUyBl
bnRyeS9leGl0IGxvZ2ljIHRvIHZpcnR1YWxpc2UgSUJSUyBzdXBwb3J0IGZvcgo+ICsgICAgICAg
ICAqIGd1ZXN0cy4KPiArICAgICAgICAgKi8KPiArICAgICAgICBpZiAoIGlicnMgKQo+ICsgICAg
ICAgICAgICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX1hFTl9JQlJTX1NFVCk7Cj4g
KyAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFU
VVJFX1hFTl9JQlJTX0NMRUFSKTsKPiArICAgIH0KPgoKQXJlIHlvdSBnb2luZyB0byBhZGQgc3Vw
cG9ydCBmb3IgSW50ZWwncyAiRW5oYW5jZWQgSUJSUyIgKEkgdGhpbmsgdGhhdCdzCndoYXQgdGhl
eSBjYWxsIHRoZSAiYWx3YXlzIG9uIiBtb2RlIik/CgotYm9yaXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
