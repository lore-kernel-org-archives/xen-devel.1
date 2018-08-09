From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] common/gnttab: Explicitly default to gnttab
 v1 during domain creation
Date: Thu, 9 Aug 2018 12:21:54 +0100
Message-ID: <5341956f-a851-3958-75df-eb3b7701107c@citrix.com>
References: <1533810718-6010-1-git-send-email-andrew.cooper3@citrix.com>
 <7db7cf2c487847e28b52360ca8dcef01@AMSPEX02CL03.citrite.net>
 <6bdf9010-88b2-a7ad-ff9d-d5b18be364f8@citrix.com>
 <3242324df4b143b889a2d1845fa8199b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3242324df4b143b889a2d1845fa8199b@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDgvMTggMTI6MTcsIFBhdWwgRHVycmFudCB3cm90ZToKPj4KPj4+PiB3aGljaCByZWFy
cmFuZ2VzIGxhcmdlIGNodW5rcyBvZiBET01DVExfY3JlYXRlZG9tYWluCj4+Pj4gLS0tCj4+Pj4g
IHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyB8IDQwICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzMg
ZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJs
ZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gaW5kZXggZDllYzcxMS4uOGJhZTY1
NiAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+PiArKysgYi94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+PiBAQCAtNDksMTAgKzQ5LDcgQEAgc3RydWN0IGdy
YW50X3RhYmxlIHsKPj4+PiAgICAgIHBlcmNwdV9yd2xvY2tfdCAgICAgICBsb2NrOwo+Pj4+ICAg
ICAgLyogTG9jayBwcm90ZWN0aW5nIHRoZSBtYXB0cmFjayBsaW1pdCAqLwo+Pj4+ICAgICAgc3Bp
bmxvY2tfdCAgICAgICAgICAgIG1hcHRyYWNrX2xvY2s7Cj4+Pj4gLSAgICAvKgo+Pj4+IC0gICAg
ICogVGhlIGRlZmluZWQgdmVyc2lvbnMgYXJlIDEgYW5kIDIuICBTZXQgdG8gMCBpZiB3ZSBkb24n
dCBrbm93Cj4+Pj4gLSAgICAgKiB3aGF0IHZlcnNpb24gdG8gdXNlIHlldC4KPj4+PiAtICAgICAq
Lwo+Pj4gR2l2ZW4gdGhhdCBvbmx5IHRoZSBndWVzdCBjYW4gc2V0IHRoZSB2ZXJzaW9uIGJ5IGh5
cGVyY2FsbCwgaXQgbWlnaHQgYmUKPj4gd29ydGggY29tbWVudCBzb21ld2hlcmUgc2F5aW5nIHRo
YXQgZ3JhbnQgdGFibGUgYWx3YXlzIHN0YXJ0IGluIHYxIGZvcm1hdAo+PiBhbmQgdGhlbiBnZXQg
bW9ycGhlZCBpZiB0aGUgZ3Vlc3Qgc2V0cyB2Mi4gSSBndWVzcyBpdCBtaWdodCBiZSBpbmZlcnJl
ZCB0aGF0IGEKPj4gdjEgdGFibGUgaXMgaW1tdXRhYmxlIChmb3IgdGhvc2Ugd2hvIGRvbid0IGxv
b2sgdG9vIGhhcmQpLgo+Pgo+PiBSZWFsbHk/wqAgSSBkb24ndCB0aGluayB0aGF0J3MgYSByZWFz
b25hYmxlIGluZmVyZW5jZSB0byBtYWtlLCBnaXZlbgo+PiBHTlRUQUJPUF9zZXRfdmVyc2lvbiBh
cyBhIHB1YmxpYyBpbnRlcmZhY2UuCj4+Cj4gSWYgeW91IHRoaW5rIGl0IGlzIHN1ZmZpY2llbnRs
eSBldmlkZW50IHRoZW4gZmluZSwgYnV0IHRoZSBjb21tZW50IHlvdSdyZSByZW1vdmluZyBpbXBs
aWVzIHRoYXQgMCAtPiAxIGFuZCAwIC0+IDIgYXJlIHZhbGlkIHRyYW5zaXRpb25zIGJ1dCBtYXli
ZSAxIC0+IDIgaXMgbm90IChvdGhlcndpc2Ugd2h5IHdvdWxkIHlvdSBoYXZlIDAsIHJpZ2h0PykK
Ci8qIERlZmF1bHRzIHRvIHYxLsKgIE1heSBiZSBjaGFuZ2VkIHdpdGggR05UVEFCT1Bfc2V0X3Zl
cnNpb24uwqAgQWxsIG90aGVyCnZhbHVlcyBhcmUgaW52YWxpZC4gKi8KCj8KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
