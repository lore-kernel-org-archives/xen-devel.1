From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 06/11] optee: add std call handling
Date: Thu, 17 Jan 2019 20:00:45 +0000
Message-ID: <5833586a-615d-ed88-5d2f-96e4b0c8c56f@arm.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-7-volodymyr_babchuk@epam.com>
 <f4b2976d-c776-1984-c9b6-ae371aa05217@arm.com> <87va2ntimz.fsf@epam.com>
 <67d7e422-246a-10db-341d-07b51cd5085f@arm.com> <87tvi7t7vn.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HtQs=PZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkDqq-0003o5-Nl
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 20:01:20 +0000
In-Reply-To: <87tvi7t7vn.fsf@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxLzE3LzE5IDc6MTMgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4gQWN0dWFs
bHksIE9QLVRFRSBwcm90b2NvbCBoYXZlIHBvc3NpYmlsaXR5IHRvIGhhbmRsZSBsaW1pdGVkIG51
bWJlciBvZgo+Pj4gdGhyZWFkcyBjb3JyZWN0bHkuIE9QLVRFRSBjYW4gcmVwb3J0IHRoYXQgYWxs
IHRocmVhZHMgYXJlIGJ1c3kgYW5kCj4+PiBjbGllbnQgd2lsbCB3YWl0IGZvciBhIGZyZWUgb25l
LiBYRU4gY2FuIGRvIHRoZSBzYW1lLCBhbHRob3VnaCB0aGlzIGlzIG5vdAo+Pj4gaW1wbGVtZW50
ZWQgaW4gdGhpcyBwYXRjaCBzZXJpZXMuIEJ1dCBJIGNhbiBhZGQgdGhpcy4KPj4KPj4gQ291bGQg
eW91IGV4cGFuZCBieSB3YWl0PyBXaWxsIGl0IGJsb2NrIGluIE9QLVRFRS9YZW4gb3IgZG9lcyBp
dAo+PiByZXR1cm4gdG8gdGhlIGd1ZXN0Pwo+IEl0IHJldHVybnMgdG8gdGhlIGd1ZXN0IHdpdGgg
cmVzcG9uc2UgY29kZQo+IE9QVEVFX1NNQ19SRVRVUk5fRVRIUkVBRF9MSU1JVC4gTGludXggZHJp
dmVyIGJsb2NrcyBjYWxsaW5nIGFwcGxpY2F0aW9uCj4gdGhyZWFkIHVudGlsIG9uZSBvZiB0aGUg
Y2FsbHMgdG8gT1AtVEVFIGlzIGZpbmlzaGVkLiBUaGVuIGRyaXZlciBhd2FrZW5zCj4gb25lIG9m
IHRoZSBibG9ja2VkIHRocmVhZHMsIHNvIGl0IGNhbiBwZXJmb3JtIHRoZSBjYWxsLgoKU2hvdWxk
bid0IG5vdCB5b3UgcmV0dXJuIHRoaXMgdmFsdWUgd2hlbiB5b3UgcmVhY2ggb3V0IE1BWF9TVERf
Q0FMTFM/CgpBY3R1YWxseSwgbG9va2luZyBhdCB0aGUgY29kZSwgeW91IGRvbid0IHNlZW0gdG8g
cmV0dXJuIGluIGVycm9yIGNvZGUgCndoZW4gdGhlcmUgYXJlIGEgZmFpbHVyZSBpbiB0aGUgbWVk
aWF0b3IuIEluc3RlYWQgeW91IHNlZW0gdG8gYWx3YXlzIApyZXR1cm4gImZhbHNlIi4gV2hpY2gg
bWVhbnMgdGhlIHZpcnR1YWwgU01DQ0MgZnJhbWV3b3JrIHRoaW5rcyB0aGUgY2FsbCAKd2FzIG5l
dmVyIGhhbmRsZWQuIEhvd2V2ZXIsIHRoaXMgaXMgbm90IHRydWUsIHlvdSBoYW5kbGVkIHRoZSBj
YWxsIGJ1dCAKdGhlIHRoZXJlIHdhcyBhIGZhaWx1cmUgZHVyaW5nIGl0LgoKSW4gZ2VuZXJhbCwg
aGFuZGxlX2NhbGwgc2hvdWxkIHJldHVybiBmYWxzZSBvbmx5IGlmIHRoZSBjYWxsIGlzIApub24t
ZXhpc3RlbnQuIEluIGFsbCB0aGUgb3RoZXIgY2FzZSwgeW91IHNob3VsZCBmZWVkIGEgcHJvcGVy
IHJldHVybiBieSAKeW91cnNlbGYuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
