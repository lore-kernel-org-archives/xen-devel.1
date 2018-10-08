From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Mon, 8 Oct 2018 11:30:21 +0100
Message-ID: <c6724ce1-086f-3492-2c39-8192542ff5d8@arm.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
 <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
 <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
 <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
 <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
 <CAC4nxbsBox=FgCBx5KwkkvCHwyX2MvBGoGpa1sDyS2cF0itT=Q@mail.gmail.com>
 <074697de-7265-a1fb-2970-4128a58f09ca@arm.com>
 <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Cc: jgross@suse.com, xen-devel@lists.xensource.com, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOC8xMC8yMDE4IDEwOjEyLCBPbWthciBCb2xsYSB3cm90ZToKPiBIaSwKCkhpLAoKPiBU
aGlzIGlzIGFsc28gb2theSwgYnV0IHByb2JsZW0gaGVyZSBpcyBJIGFtIHVzaW5nIDQuOCBzdGFi
bGXCoCB4ZW4gCj4gYmVjYXVzZSBpdMKgIGlzIHdvcmtpbmcgb24gSGtleTk2MChBcm1WOCkKClRo
aXMgaXMgYmVjYXVzZSB5b3UgY2FuJ3QgYnJpbmcgdXAgc2Vjb25kYXJ5IENQVXMgb24gdGhlIEhp
a2V5IHdpdGggWGVuIAo0LjExIFsxXSwgcmlnaHQ/IEl0IHdvdWxkIGJlIG5pY2UgdG8gZmluZCB3
aGVyZSB0aGUgYnVnIHdhcyBpbnRyb2R1Y2VkIApiZWNhdXNlIFhlbiA0LjggaXMgb3V0IG9mIHN1
cHBvcnQgYW5kIGRvZXMgbm90IGNvbnRhaW4gdGhlIGxhdGVzdCBmaXhlcyAKKHN1Y2ggYXMgTWVs
dGRvd24vU3BlY3RyZSkuCgo+IElzIHRoZXJlIGFueSBvdGhlciB3YXkgdG8gc2hhcmUgYnVmZmVy
IGR5bmFtaWNhbGx5PwpZb3Ugd291bGQgaGF2ZSB0byB3cml0ZSB5b3VyIG93biBQViBkcml2ZXJz
IG9yIHBvcnQgdGhlIHNlcmllcyB0byBYZW4gNC44LgoKQ2hlZXJzLAoKWzFdIApodHRwczovL3d3
dy5tYWlsLWFyY2hpdmUuY29tL3hlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2cyMTU3
Ni5odG1sCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
