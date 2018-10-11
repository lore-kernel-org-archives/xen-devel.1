From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 11 Oct 2018 09:36:45 +0200
Message-ID: <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="00000000000018c1a30577ef09ac"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zb/w=mx=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gAVWm-0001ak-4P
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 07:37:00 +0000
Received: by mail-lj1-x236.google.com with SMTP id 63-v6so7293135ljs.4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 00:36:58 -0700 (PDT)
In-Reply-To: <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Meng Xu <xumengpanda@gmail.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

--00000000000018c1a30577ef09ac
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 10, 2018 at 6:41 PM Meng Xu <xumengpanda@gmail.com> wrote:
>
> The jitter may come from Xen or the OS in dom0.
> It will be useful to know what is the jitter if you run the test on PetaLinux.
> (It's understandable the jitter is gone without OS. It is also common
> that OS introduces various interferences.)

Hi Meng,
well... I'm using bare-metal application and I need it exclusively to
be ran on one CPU as domU (guest) without OS (and I'm not sure how
would I make the same app to be ran on PetaLinux dom0 :D haha).
Is there a chance that PetaLinux as dom0 is creating this jitter and
how? Is there a way of decreasing it?

Yes, there are no prints.

I'm not sure about this timer interrupt passthrough because I didn't
find any example of it, in attachment I included xen-overlay.dtsi file
which I edited to add passthrough, in earlier replies there are
bare-metal configuration file. It would be helpful to know if those
setting are correct. If they are not correct it would explain the
jitter.

Thanks in advance, Milan Boberic!

--00000000000018c1a30577ef09ac
Content-Type: text/plain; charset="US-ASCII"; name="xen-overlay.dts.txt"
Content-Disposition: attachment; filename="xen-overlay.dts.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jn49pw8g0>
X-Attachment-Id: f_jn49pw8g0

LyB7DQoJY2hvc2VuIHsNCgkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQoJCSNzaXplLWNlbGxzID0g
PDE+Ow0KDQoJCXhlbix4ZW4tYm9vdGFyZ3MgPSAiY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlh
bDAgZG9tMF9tZW09NzY4TSBib290c2NydWI9MCBkb20wX21heF92Y3B1cz0xIGRvbTBfdmNwdXNf
cGluPXRydWUgdGltZXJfc2xvcD0wIHNjaGVkPW51bGwgdndmaT1uYXRpdmUiOw0KCQl4ZW4sZG9t
MC1ib290YXJncyA9ICJjb25zb2xlPWh2YzAgZWFybHljb249eGVuIGVhcmx5cHJpbnRrPXhlbiBt
YXhjcHVzPTEgY2xrX2lnbm9yZV91bnVzZWQiOw0KDQoJCWRvbTAgew0KCQkJY29tcGF0aWJsZSA9
ICJ4ZW4sbGludXgtemltYWdlIiwgInhlbixtdWx0aWJvb3QtbW9kdWxlIjsNCgkJCXJlZyA9IDww
eDAgMHg4MDAwMCAweDMxMDAwMDA+Ow0KCQl9Ow0KCX07DQoNCn07DQoNCiZzbW11IHsNCglzdGF0
dXMgPSAib2theSI7DQoJbW11LW1hc3RlcnMgPSA8ICZnZW0wIDB4ODc0DQoJCQkmZ2VtMSAweDg3
NQ0KCQkJJmdlbTIgMHg4NzYNCgkJCSZnZW0zIDB4ODc3DQoJCQkmZHdjM18wIDB4ODYwDQoJCQkm
ZHdjM18xIDB4ODYxDQoJCQkmcXNwaSAweDg3Mw0KCQkJJmxwZF9kbWFfY2hhbjEgMHg4NjgNCgkJ
CSZscGRfZG1hX2NoYW4yIDB4ODY5DQoJCQkmbHBkX2RtYV9jaGFuMyAweDg2YQ0KCQkJJmxwZF9k
bWFfY2hhbjQgMHg4NmINCgkJCSZscGRfZG1hX2NoYW41IDB4ODZjDQoJCQkmbHBkX2RtYV9jaGFu
NiAweDg2ZA0KCQkJJmxwZF9kbWFfY2hhbjcgMHg4NmUNCgkJCSZscGRfZG1hX2NoYW44IDB4ODZm
DQoJCQkmZnBkX2RtYV9jaGFuMSAweDE0ZTgNCgkJCSZmcGRfZG1hX2NoYW4yIDB4MTRlOQ0KCQkJ
JmZwZF9kbWFfY2hhbjMgMHgxNGVhDQoJCQkmZnBkX2RtYV9jaGFuNCAweDE0ZWINCgkJCSZmcGRf
ZG1hX2NoYW41IDB4MTRlYw0KCQkJJmZwZF9kbWFfY2hhbjYgMHgxNGVkDQoJCQkmZnBkX2RtYV9j
aGFuNyAweDE0ZWUNCgkJCSZmcGRfZG1hX2NoYW44IDB4MTRlZg0KCQkJJnNkaGNpMCAweDg3MA0K
CQkJJnNkaGNpMSAweDg3MQ0KCQkJJm5hbmQwIDB4ODcyPjsNCn07DQoNCiZ1YXJ0MSB7DQogICB4
ZW4scGFzc3Rocm91Z2ggPSA8MHgxPjsNCn07DQoNCiZncGlvIHsNCiAgIHhlbixwYXNzdGhyb3Vn
aCA9IDwweDE+Ow0KfTsNCg0KJnR0YzAgew0KICAgeGVuLHBhc3N0aHJvdWdoID0gPDB4MT47DQp9
Ow0KDQomdHRjMSB7DQogICB4ZW4scGFzc3Rocm91Z2ggPSA8MHgxPjsNCn07DQoNCiZ0dGMyIHsN
CiAgIHhlbixwYXNzdGhyb3VnaCA9IDwweDE+Ow0KfTsNCg0KJnR0YzMgew0KICAgeGVuLHBhc3N0
aHJvdWdoID0gPDB4MT47DQp9Ow==
--00000000000018c1a30577ef09ac
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--00000000000018c1a30577ef09ac--
