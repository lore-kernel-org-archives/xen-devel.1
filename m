From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v9 06/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Mon, 22 Jan 2018 21:19:26 -0500
Message-ID: <73241145-36d9-1bf6-861e-f57bba67457f@oracle.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-7-git-send-email-andrew.cooper3@citrix.com>
 <5A61E7E702000078001A0553@prv-mh.provo.novell.com>
 <1fe16c0c-7c91-f43f-c3b6-47e82dcd2909@citrix.com>
 <0b7e80cd-c635-8fcf-7bc8-96946abe78e1@oracle.com>
 <a5a43c1d-cdf2-fd76-75d2-1fbadc671a28@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a5a43c1d-cdf2-fd76-75d2-1fbadc671a28@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8yMi8yMDE4IDA3OjE3IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIyLzAx
LzIwMTggMjI6MjcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMDEvMTkvMjAxOCAwODoz
NiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDE5LzAxLzE4IDExOjQzLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+Cj4+Pj4+IEBAIC05OSw2ICsxMDYsMTAgQEAgVU5MSUtFTFlfRU5EKHJl
YWxtb2RlKQo+Pj4+PiAgIC5Mdm14X3ZtZW50cnlfZmFpbDoKPj4+Pj4gICAgICAgICAgIHN0aQo+
Pj4+PiAgICAgICAgICAgU0FWRV9BTEwKPj4+Pj4gKwo+Pj4+PiArICAgICAgICBTUEVDX0NUUkxf
RU5UUllfRlJPTV9QViAvKiBSZXE6ICVyc3A9cmVncy9jcHVpbmZvIENsb2I6IGFjZCAqLwo+Pj4+
IEkgdGhpbmsgdGhlIHVzZSBvZiB0aGUgUFYgdmFyaWFudCBoZXJlIHJlcXVpcmVzIGEgY29tbWVu
dC4KPj4+IE9oLiAgSXQgdXNlZCB0byBoYXZlIG9uZS4uLiAgSSdsbCB0cnkgdG8gZmluZCBpdC4K
Pj4gSSwgaW4gZmFjdCwgbWVhbnQgdG8gYXNrIGFib3V0IHRoaXMgZm9yIGEgbG9uZyB0aW1lIGFu
ZCBhbHdheXMgZm9yZ290Lgo+PiBQZXJoYXBzIHlvdXIgY29tbWVudCB3aWxsIHNheSBtb3JlIHRo
YW4ganVzdCB3aHkgYSBQViB2YXJpYW50IGlzIHVzZWQKPj4gaGVyZSBidXQgaW4gY2FzZSBpdCB3
b24ndCAtLS0gd2h5IGRvIHdlIGhhdmUgKmFueSogbWl0aWdhdGlvbiBoZXJlPyBXZQo+PiBhcmUg
bmV2ZXIgcmV0dXJuaW5nIHRvIHRoZSBndWVzdCwgZG8gd2U/Cj4gCj4gV2UgbmV2ZXIgcmV0dXJu
IHRvICp0aGlzKiBndWVzdCwgYnV0IHdlIGFyZSBzdGlsbCBvcGVuIHRvIGFidXNlIGZyb20gYQo+
IHNlcGFyYXRlIGh5cGVydGhyZWFkLCBzbyBzdGlsbCBuZWVkIHRvIHNldCBTUEVDX0NUUkwuSUJS
UyBpZiB3ZSBhcmUKPiB1c2luZyBJQlJTIGZvciBzYWZldHkuwqAgKElmIHdlIGFyZSB1c2luZyBs
ZmVuY2Uram1wIG9yIHJlcG9saW5lIHRoZW4gd2UKPiBkb24ndCBuZWVkIHRoaXMgY2hhbmdlLCBi
dXQgaXRzIG5vdCBhIGhvdHBhdGggc28gZG9lc24ndCB3YXJyYW50IHlldAo+IGFub3RoZXIgdmFy
aWFudCBvZiBTUEVDX0NUUkxfRU5UUllfRlJPTV8qLikKCgpXZSB3cm90ZSBJQlJTIGR1cmluZyBW
TUVYSVQuIEkgdGhvdWdodCB0aGlzIHNlcnZlcyBhcyBiYXJyaWVyIGZvciBhbGwgCnByZWNlZGlu
ZyBwcmVkaWN0aW9ucyAoYm90aCB0aHJlYWRzKSBmcm9tIGxvd2VyIHByb3RlY3Rpb24gbW9kZS4K
CklzIHRoZSBjb25jZXJuIGhlcmUgdGhhdCBTUEVDX0NUUkxfRVhJVF9UT19HVUVTVCAoYmVmb3Jl
IFZNRU5URVIpIG1heSAKc2V0IElCUlMgdG8gMCBhbmQgKnRoYXQqIHdpbGwgb3BlbiBoeXBlcnZp
c29yIHRvIG90aGVyIHRocmVhZCdzIG1pc2NoaWVmPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
