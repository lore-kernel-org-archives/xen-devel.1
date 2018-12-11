From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen optimization
Date: Tue, 11 Dec 2018 11:29:46 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812111122540.12259@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
 <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
 <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
 <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
 <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
 <alpine.DEB.2.10.1812111038130.12259@sstabellini-ThinkPad-X260>
 <b0fe0367-5378-83aa-39e1-79badb37922b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2g57=OU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gWnj3-0004mL-Oe
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 19:29:49 +0000
In-Reply-To: <b0fe0367-5378-83aa-39e1-79badb37922b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMSBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDExLzEyLzIwMTgg
MTg6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTEgRGVjIDIwMTgs
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gMTAvMTIvMjAxOCAxMjoyMywgQW5kcmlpIEFu
aXNvdiB3cm90ZToKPiA+ID4gPiBIZWxsbyBKdWxpZW4sCj4gPiA+ID4gCj4gPiA+ID4gT24gMTAu
MTIuMTggMTM6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IFdoYXQgYXJlIHRoZSBu
dW1iZXJzIHdpdGhvdXQgWGVuPwo+ID4gPiA+IEdvb2QgcXVlc3Rpb24uIERpZG4ndCB0cnkuIEF0
IGxlYXN0IHB1dGNoYXIgc2hvdWxkIGJlIGltcGxlbWVudGVkIGZvcgo+ID4gPiA+IHRoYXQuCj4g
PiA+IAo+ID4gPiBJIHRoaW5rIHdlIG5lZWQgdGhlIGJhcmVtZXRhbCBudW1iZXJzIHRvIGJlIGFi
bGUgdG8gY29tcGFyZSBwcm9wZXJseSB0aGUKPiA+ID4gb2xkCj4gPiA+IGFuZCBuZXcgdkdJQy4K
PiA+IAo+ID4gVGhhdCBtaWdodCBwcm92ZSB2ZXJ5IGhhcmQgZm9yIEFuZHJpaSB0byBkbyBiZWNh
dXNlIFRCTSBpcyBtYWRlIHRvIHJ1bgo+ID4gb24gWGlsaW54IGhhcmR3YXJlIGFuZCBYZW4gVk1z
IG9ubHkuIEl0IGlzIHByb2JhYmx5IGxhY2tpbmcgbmVjZXNzYXJ5Cj4gPiBkcml2ZXJzIHRvIHJ1
biBvbiBvdGhlciBib2FyZHMgbmF0aXZlbHkuCj4gCj4gUmVhbGx5PyBXaGF0IHNvcnQgb2YgcGxh
dGZvcm0gc3BlY2lmaWMgZHJpdmVyIGRvIHlvdSBuZWVkPyBTaG91bGRuJ3QgdGhlIFVBUlQgYmUg
c3VmZmljaWVudD8KClllcywgSSB0aGluayB0aGUgdWFydCBkcml2ZXIgY291bGQgYmUgc3VmZmlj
aWVudCwgYnV0IGl0IGhhcyBvbmx5IHRoZQpYaWxpbnggdWFydCwgdGhlIHBsMDExIGFuZCB0aGUg
WGVuIGVtZXJnZW5jeSBjb25zb2xlLiBJZiBJIHJlY2FsbApjb3JyZWN0bHksIFJlbmVzYXMgbmVl
ZHMgYSBkaWZmZXJlbnQgZHJpdmVyLiBBbnkgcGxhdGZvcm0gc3BlY2lmaWMKaW5pdGlhbGl6YXRp
b24gd291bGQgYWxzbyBuZWVkIHRvIGJlIGFkZGVkIHRvIGl0LgoKCj4gV2hlbiB5b3Ugc3BlYWsg
YWJvdXQgaW50ZXJydXB0IGxhdGVuY3ksIHlvdSBuZWVkIHRvIGNvbXBhcmUgdG8gYmFyZW1ldGFs
Lgo+IE90aGVyd2lzZSBpdCBoYXMgbm8gbWVhbmluZyBhdCBhbGwuIFNvIHdoYXQgaXMgeW91ciBz
b2x1dGlvbj8KCldoZW4gSSB1c2VkIGl0LCBJIHJhbiBvbiBYaWxpbnggaGFyZHdhcmUsIHRoYXQg
d2FzIG15IHNvbHV0aW9uIDotRAoKQW5kcmlpIHdvdWxkIGhhdmUgdG8gcG9ydCBhIHVhcnQgZHJp
dmVyIHRvIGl0LiBNYXliZSB0aGUgZWFybHlfcHJpbnRrCnRyaXZpYWwgZHJpdmVyIGNvdWxkIGJl
IGVhc3kgZW5vdWdoIHRvIHBvcnQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
