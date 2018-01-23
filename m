From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9 06/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Tue, 23 Jan 2018 00:17:53 +0000
Message-ID: <a5a43c1d-cdf2-fd76-75d2-1fbadc671a28@citrix.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-7-git-send-email-andrew.cooper3@citrix.com>
 <5A61E7E702000078001A0553@prv-mh.provo.novell.com>
 <1fe16c0c-7c91-f43f-c3b6-47e82dcd2909@citrix.com>
 <0b7e80cd-c635-8fcf-7bc8-96946abe78e1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0b7e80cd-c635-8fcf-7bc8-96946abe78e1@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOCAyMjoyNywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAxLzE5LzIw
MTggMDg6MzYgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDE5LzAxLzE4IDExOjQzLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4KPj4+PiBAQCAtOTksNiArMTA2LDEwIEBAIFVOTElLRUxZX0VO
RChyZWFsbW9kZSkKPj4+PiAgLkx2bXhfdm1lbnRyeV9mYWlsOgo+Pj4+ICAgICAgICAgIHN0aQo+
Pj4+ICAgICAgICAgIFNBVkVfQUxMCj4+Pj4gKwo+Pj4+ICsgICAgICAgIFNQRUNfQ1RSTF9FTlRS
WV9GUk9NX1BWIC8qIFJlcTogJXJzcD1yZWdzL2NwdWluZm8gQ2xvYjogYWNkICovCj4+PiBJIHRo
aW5rIHRoZSB1c2Ugb2YgdGhlIFBWIHZhcmlhbnQgaGVyZSByZXF1aXJlcyBhIGNvbW1lbnQuCj4+
IE9oLiAgSXQgdXNlZCB0byBoYXZlIG9uZS4uLiAgSSdsbCB0cnkgdG8gZmluZCBpdC4KPiBJLCBp
biBmYWN0LCBtZWFudCB0byBhc2sgYWJvdXQgdGhpcyBmb3IgYSBsb25nIHRpbWUgYW5kIGFsd2F5
cyBmb3Jnb3QuCj4gUGVyaGFwcyB5b3VyIGNvbW1lbnQgd2lsbCBzYXkgbW9yZSB0aGFuIGp1c3Qg
d2h5IGEgUFYgdmFyaWFudCBpcyB1c2VkCj4gaGVyZSBidXQgaW4gY2FzZSBpdCB3b24ndCAtLS0g
d2h5IGRvIHdlIGhhdmUgKmFueSogbWl0aWdhdGlvbiBoZXJlPyBXZQo+IGFyZSBuZXZlciByZXR1
cm5pbmcgdG8gdGhlIGd1ZXN0LCBkbyB3ZT8KCldlIG5ldmVyIHJldHVybiB0byAqdGhpcyogZ3Vl
c3QsIGJ1dCB3ZSBhcmUgc3RpbGwgb3BlbiB0byBhYnVzZSBmcm9tIGEKc2VwYXJhdGUgaHlwZXJ0
aHJlYWQsIHNvIHN0aWxsIG5lZWQgdG8gc2V0IFNQRUNfQ1RSTC5JQlJTIGlmIHdlIGFyZQp1c2lu
ZyBJQlJTIGZvciBzYWZldHkuwqAgKElmIHdlIGFyZSB1c2luZyBsZmVuY2Uram1wIG9yIHJlcG9s
aW5lIHRoZW4gd2UKZG9uJ3QgbmVlZCB0aGlzIGNoYW5nZSwgYnV0IGl0cyBub3QgYSBob3RwYXRo
IHNvIGRvZXNuJ3Qgd2FycmFudCB5ZXQKYW5vdGhlciB2YXJpYW50IG9mIFNQRUNfQ1RSTF9FTlRS
WV9GUk9NXyouKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
