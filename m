From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Xen project CI systems and committer workflow
Date: Thu, 25 Apr 2019 15:51:26 +0100
Message-ID: <569d1a48-01ff-2fa7-5b95-59ac026afb14@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5CC1A90702000078002290A0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e2cZ=S3=citrix.com=prvs=011b50515=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hJfil-0005pw-Vw
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:51:32 +0000
In-Reply-To: <5CC1A90702000078002290A0@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, committers@xenproject.org, Doug Goldstein <cardoe@cardoe.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNS8xOSAxOjMzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2l0aCB0aGlzIHN5c3Rl
bSwgYWxsIHB1Ymxpc2hlZCBjb21taXRzIHNob3VsZCBoYXZlIGFscmVhZHkgcGFzc2VkIEdpdGxh
YiBDSQo+PiBhbmQgb3NzdGVzdCB0ZXN0cy4KPiAKPiBXaGlsZSB0aGlzIGlzIGNlcnRhaW5seSBk
ZXNpcmFibGUgYXMgYSBnb2FsLCBpcyB0aGUgcHJvYmxlbSBvZgo+IG9jY2FzaW9uYWwgYnVpbGQg
aXNzdWVzIHJlYWxseSB0aGlzIGJpZywgd2FycmFudGluZyBpbnRyb2R1Y3Rpb24KPiBvZiBmdXJ0
aGVyIG92ZXJoZWFkPwoKWW91IHNlZW0gdG8gaGF2ZSBtaXNzZWQgdGhlIGNvbmp1Y3Rpb24gYXQg
dGhlIGVuZCBvZiB0aGUgc2VudGVuY2UgeW91J3JlCnJlbHB5aW5nIHRvOgoKIi4uLmFuZCBvc3N0
ZXN0IHRlc3RzIi4KCkl0J3Mgbm90IG1haW5seSB0byBzdG9wIG9jY2FzaW9uYWwgYnVpbGQgaXNz
dWVzOyBpdCdzIHRvIHN0b3AKbG9uZy1ydW5uaW5nIHB1c2hnYXRlIGZhaWx1cmVzLgoKPj4gIyMg
Q29uY2VybnMKPj4KPj4gRm9yIGluZGl2aWR1YWwgY29tbWl0dGVycywgdHVybmFyb3VuZCB0aW1l
IG1heSBiZWNvbWUgbG9uZ2VyIHNpbmNlIHlvdSBuZWVkIHRvCj4+IHdhaXQgZm9yIG90aGVyIHRy
ZWVzIHRvIGJlIHByb2Nlc3NlZC4KPiAKPiBUb2dldGhlciB3aXRoIHRoaXMgbGFyZ2VyIGxhdGVu
Y3ksIGNoYW5jZXMgaW5jcmVhc2UgdGhhdCB0d28KPiBjb21taXR0ZXJzIHBpY2sgdXAgdGhlIHNh
bWUgcGF0Y2ggb3Igc2VyaWVzLiBXaXRoIHRvZGF5J3MKPiBzaW5nbGUgY2VudHJhbCBpbnN0YW5j
ZSBldmVyeW9uZSBwdXNoZXMgdG8gaXQgaXMgYXQgbGVhc3QKPiBwb3NzaWJsZSB0byBjaGVjayB3
aGV0aGVyIHNvbWV0aGluZyBoYXMgZ29uZSBpbiBhbHJlYWR5Cj4gYmVmb3JlIHN0YXJ0aW5nIHRv
IGNvbW1pdCB0aGluZ3MuIElpcmMgd2hlbmV2ZXIgSSBlbmRlZCB1cAo+IHRyeWluZyB0byBjb21t
aXQgYSBwYXRjaCB0aGF0IHdhcyBhbHJlYWR5IHRoZXJlLCBpdCB3YXMKPiBiZWNhdXNlIG9mIG1l
IG5vdCBoYXZpbmcgY2hlY2tlZCAoYWdhaW4pLCByYXRoZXIgdGhhbgo+IGJlY2F1c2Ugb2YgYW4g
YWN0dWFsIHJhY2UuCgpJZiB0aGlzIGJlY29tZXMgYW4gaXNzdWUsIEknbSBzdXJlIHdlIGNhbiBz
b3J0IG91dCBhIHRlY2huaWNhbCBzb2x1dGlvbi4KIEEgcHJlLXB1c2ggc2NyaXB0IHRoYXQgY2hl
Y2tzIG90aGVyICJvcGVuIiBzdWJtaXNzaW9ucyBmb3IgZHVwbGljYXRlcwpzaG91bGRuJ3QgYmUg
ZGlmZmljdWx0IHRvIGltcGxlbWVudC4gICBIYXZpbmcgYSB1bmlmaWVkIHBsYWNlIGZvcgpjb21t
aXR0ZXJzIHRvIHNpbXBseSBhcHByb3ZlIHBvc3RzIGZvciBtZXJnaW5nIChyYXRoZXIgdGhhbiBz
dWJtaXR0aW5nIGEKcHVsbCByZXF1ZXN0KSB3b3VsZCBiZSBhIGxvbmdlci10ZXJtIGltcHJvdmVt
ZW50LgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
