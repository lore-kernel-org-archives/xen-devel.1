From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: null scheduler bug
Date: Tue, 25 Sep 2018 12:12:59 +0200
Message-ID: <CADJ6SV3agkcdWc0T1quMO2q44wQEBHoYjxQNwjFrevMzN0qweg@mail.gmail.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000005c200e0576af5a0f"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k9t6=mh=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1g4kLB-0004hq-LI
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 10:13:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id 203-v6so21116192ljj.13
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 03:13:12 -0700 (PDT)
In-Reply-To: <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, stefano@stabellini.net
List-Id: xen-devel@lists.xenproject.org

--0000000000005c200e0576af5a0f
Content-Type: text/plain; charset="UTF-8"

Hello guys,
mapping on my system is:
dom0 have one vCPU and it is pinned on pCPU0
domU also have one vCPU and it's pinned for pCPU2

I removed only vwfi=native and everything works fine. I can destroy
and create a guest as many times as I want with out any error (still
using sched=null).

These are xen bootargs in Xen-overlay.dtsi file:
 xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=768M
bootscrub=0 maxcpus=1 dom0_max_vcpus=1 dom0_vcpus_pin=true
timer_slop=0 core_parking=performance cpufreq=xen:performance
sched=null";

There is whole xen-overlay.dtsi file included in attachment.

Purpose of my work is implementing xen on UltraZed-EG board with
maximum performance (and lowest jitter, which is why I'm using null
scheduler and "hard" vcpu pinning) which is my master's thesis on
faculty. By removing vwfi=native I'm not getting the best performance,
right? vwfi=native should decrease interrupt latency by ~60% as I read
here:

https://blog.xenproject.org/author/stefano-stabellini/

Big thanks to Julien for having a look!

--0000000000005c200e0576af5a0f
Content-Type: text/plain; charset="US-ASCII"; name="xen-overlay.txt"
Content-Disposition: attachment; filename="xen-overlay.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jmhjv5pc0>
X-Attachment-Id: f_jmhjv5pc0

LyB7DQoJY2hvc2VuIHsNCgkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQoJCSNzaXplLWNlbGxzID0g
PDE+Ow0KDQoJCXhlbix4ZW4tYm9vdGFyZ3MgPSAiY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlh
bDAgZG9tMF9tZW09NzY4TSBib290c2NydWI9MCBtYXhjcHVzPTEgZG9tMF9tYXhfdmNwdXM9MSBk
b20wX3ZjcHVzX3Bpbj10cnVlIHRpbWVyX3Nsb3A9MCBjb3JlX3Bhcmtpbmc9cGVyZm9ybWFuY2Ug
Y3B1ZnJlcT14ZW46cGVyZm9ybWFuY2Ugc2NoZWQ9bnVsbCI7DQoJCXhlbixkb20wLWJvb3Rhcmdz
ID0gImNvbnNvbGU9aHZjMCBlYXJseWNvbj14ZW4gZWFybHlwcmludGs9eGVuIG1heGNwdXM9MSBj
bGtfaWdub3JlX3VudXNlZCI7DQoNCgkJZG9tMCB7DQoJCQljb21wYXRpYmxlID0gInhlbixsaW51
eC16aW1hZ2UiLCAieGVuLG11bHRpYm9vdC1tb2R1bGUiOw0KCQkJcmVnID0gPDB4MCAweDgwMDAw
IDB4MzEwMDAwMD47DQoJCX07DQoJfTsNCg0KfTsNCg0KJnNtbXUgew0KCXN0YXR1cyA9ICJva2F5
IjsNCgltbXUtbWFzdGVycyA9IDwgJmdlbTAgMHg4NzQNCgkJCSZnZW0xIDB4ODc1DQoJCQkmZ2Vt
MiAweDg3Ng0KCQkJJmdlbTMgMHg4NzcNCgkJCSZkd2MzXzAgMHg4NjANCgkJCSZkd2MzXzEgMHg4
NjENCgkJCSZxc3BpIDB4ODczDQoJCQkmbHBkX2RtYV9jaGFuMSAweDg2OA0KCQkJJmxwZF9kbWFf
Y2hhbjIgMHg4NjkNCgkJCSZscGRfZG1hX2NoYW4zIDB4ODZhDQoJCQkmbHBkX2RtYV9jaGFuNCAw
eDg2Yg0KCQkJJmxwZF9kbWFfY2hhbjUgMHg4NmMNCgkJCSZscGRfZG1hX2NoYW42IDB4ODZkDQoJ
CQkmbHBkX2RtYV9jaGFuNyAweDg2ZQ0KCQkJJmxwZF9kbWFfY2hhbjggMHg4NmYNCgkJCSZmcGRf
ZG1hX2NoYW4xIDB4MTRlOA0KCQkJJmZwZF9kbWFfY2hhbjIgMHgxNGU5DQoJCQkmZnBkX2RtYV9j
aGFuMyAweDE0ZWENCgkJCSZmcGRfZG1hX2NoYW40IDB4MTRlYg0KCQkJJmZwZF9kbWFfY2hhbjUg
MHgxNGVjDQoJCQkmZnBkX2RtYV9jaGFuNiAweDE0ZWQNCgkJCSZmcGRfZG1hX2NoYW43IDB4MTRl
ZQ0KCQkJJmZwZF9kbWFfY2hhbjggMHgxNGVmDQoJCQkmc2RoY2kwIDB4ODcwDQoJCQkmc2RoY2kx
IDB4ODcxDQoJCQkmbmFuZDAgMHg4NzI+Ow0KfTsNCg0KJnVhcnQxIHsNCiAgIHhlbixwYXNzdGhy
b3VnaCA9IDwweDE+Ow0KfTsNCg0KJmdwaW8gew0KICAgeGVuLHBhc3N0aHJvdWdoID0gPDB4MT47
DQp9Ow==
--0000000000005c200e0576af5a0f
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--0000000000005c200e0576af5a0f--
